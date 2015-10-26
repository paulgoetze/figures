require_relative "figures/version"

module Figures

  def self.parse(number, language_code = :de)
    number_triples = number.to_s.reverse.scan(/.{1,3}/).map{ |triple| triple.reverse.to_i }
    number_triples.map.with_index { |part, index| german_words_for(part.to_i, index) }.reverse.join('').gsub(/^und/, '')
  end

  ONE = 0
  TEN = 1
  HUNDRED = 2

  def self.german_words_for(number, triple_index)
    return 'null' if number == 0
    return 'eins' if number == 1 && triple_index == 0
    return 'minus eins' if number == -1 && triple_index == 0

    words = [
        [ :und, :ein, :zwei, :drei, :vier, :fünf, :sechs, :sieben, :acht, :neun ],
        [ :eine, :zehn, :zwanzig, :dreißig, :vierzig, :fünfzig, :sechzig, :siebzig, :achzig, :neunzig ],
        [
          :hundert, :tausend, :million, :milliarden, :billion, :billiarden, :trillion, :trilliarden,
          :quadrillionen, :quadrilliarden, :quintillion, :sextillion, :sextilliarden
        ]
      ]

    temp_number = number.abs
    number_word = ""
    temp_tens = ""

    while  temp_number > 0
      decimal_power = Math.log10(temp_number).floor
      num = temp_number - (temp_number % (10 ** decimal_power))
      index = num / (10 ** decimal_power)
      copula = ((index > 1) ? words[0][0].to_s : "")
      leading_single = (triple_index >= 2 && index == 1) ? words[1][0].to_s : words[0][index].to_s

      number_word << words[0][index].to_s << words[2][0].to_s if decimal_power == HUNDRED
      number_word << words[0][index].to_s if decimal_power == ONE && !temp_tens.empty?
      number_word << copula << leading_single if decimal_power == ONE && temp_tens.empty?
      temp_tens << copula << words[1][index].to_s if decimal_power == TEN

      temp_number = temp_number - num
    end

    number_word << temp_tens
    number_word << words[2][triple_index].to_s if triple_index > 0
    number_word = number_word.gsub('einzehn', 'elf')
    number_word = number_word.gsub('zweizehn', 'zwölf')
    number_word = number_word.gsub('sechszehn', 'sechzehn')
    number_word = number_word.gsub('siebenzehn', 'siebzehn')
    number_word = number_word.gsub(/^(und|null)/, '')
    number_word = "minus #{number_word}" if number < 0
    number_word
  end

  end


