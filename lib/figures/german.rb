module Figures
  class German
    WORDS = {
      copula: "und",
      digits: %w[null ein zwei drei vier fünf sechs sieben acht neun],
      tens: %w[eine zehn zwanzig dreißig vierzig fünfzig sechzig siebzig achzig neunzig],
      exponents: %w[hundert tausend million milliarden billion billiarden trillion trilliarden quadrillionen quadrilliarden quintillion sextillion sextilliarden]
    }.freeze

    def initialize(number)
      @number = number
    end

    def parse
      number_triples = @number.to_s.reverse.scan(/.{1,3}/).map do |triple|
        triple.reverse.to_i
      end

      word_parts = number_triples.map.with_index do |part, index|
        parse_triple(part.to_i, index)
      end

      word_parts.reverse.join('').gsub(/^und/, '')
    end

    def parse_triple(number, triple_index)
      return 'null'       if number == 0
      return 'eins'       if number == 1 && triple_index == 0
      return 'minus eins' if number == -1 && triple_index == 0

      temp_number = number.abs
      number_word = ""
      temp_tens   = ""

      while temp_number > 0
        decimal_power = Math.log10(temp_number).floor
        num = temp_number - (temp_number % (10 ** decimal_power))
        index = num / (10 ** decimal_power)
        copula = ((index > 1) ? WORDS[:copula] : "")
        leading_single = (triple_index >= 2 && index == 1) ? WORDS[:tens][0].to_s : WORDS[:digits][index].to_s

        if decimal_power == 2
          number_word << WORDS[:digits][index].to_s << WORDS[:exponents][0].to_s
        end

        if decimal_power == 0 && !temp_tens.empty?
          number_word << WORDS[:digits][index].to_s
        end

        if decimal_power == 0 && temp_tens.empty?
          number_word << copula << leading_single
        end

        if decimal_power == 1
          temp_tens << copula << WORDS[:tens][index].to_s
        end

        temp_number = temp_number - num
      end

      number_word << temp_tens

      if triple_index > 0
        number_word << WORDS[:exponents][triple_index].to_s
      end

      number_word = handle_exceptions(number_word)
      number_word = remove_wrong_leadings(number_word)

      if number < 0
        number_word = "minus #{number_word}"
      end

      number_word
    end

    def handle_exceptions(word)
      word = word.gsub('einzehn', 'elf')
      word = word.gsub('zweizehn', 'zwölf')
      word = word.gsub('sechszehn', 'sechzehn')
      word = word.gsub('siebenzehn', 'siebzehn')
    end

    def remove_wrong_leadings(word)
      word.gsub(/^(und|null)/, '')
    end
    
  end
end