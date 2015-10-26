module Figures
  class German
    WORDS = {
      copula: "und",
      digits: %w[null ein zwei drei vier fünf sechs sieben acht neun],
      tens: %w[eine zehn zwanzig dreißig vierzig fünfzig sechzig siebzig achzig neunzig],
      exponents: %w[hundert tausend million milliarden billion billiarden trillion trilliarden quadrillionen quadrilliarden quintillion sextillion sextilliarden]
    }.freeze

    def initialize(number)
      @number = number.to_i
    end

    def parse
      return WORDS[:digits][@number] if @number < 10 && @number >= 0

      triples = @number.to_s.reverse.scan(/.{1,3}/)
      number_string = triples.map.with_index{ |number_part, index|
        parse_triple number_part.reverse.to_i, index, triples.size - 1 == index
      }.reverse.join

      number_string.sub! /^und/, '' # TODO investigate

      if @number < 0
        "minus #{number_string}"
      else
        number_string
      end
    end

    def parse_triple(number, triple_index, is_leading)
      temp_number = number.abs
      number_word = ""
      temp_tens   = ""
      ten_exists = false

      # return 'eins' if temp_number == 1 && triple_index == 0 # FIXME 

      while temp_number > 0
        decimal_power = Math.log10(temp_number).floor
        number_base = 10 ** decimal_power
        number_tail = temp_number - (temp_number % number_base)
        digit = number_tail / number_base

        copula = ((digit > 1) ? WORDS[:copula] : "")
        leading_single = (triple_index >= 2 && digit == 1) ? WORDS[:tens][0].to_s : WORDS[:digits][digit].to_s

        if decimal_power == 2
          number_word << WORDS[:digits][digit].to_s << WORDS[:exponents][0].to_s
        end

        if decimal_power == 0 && !temp_tens.empty?
          number_word << WORDS[:digits][digit].to_s
        end

        if decimal_power == 0 && temp_tens.empty?
          if digit == 1# && !is_leading
            number_word << "eins"
          else
            number_word << copula << leading_single
          end
        end

        if decimal_power == 1
          temp_tens << copula << WORDS[:tens][digit].to_s
          ten_exists = true
        end

        temp_number = temp_number - number_tail
      end

      number_word << temp_tens

      if triple_index > 0
        number_word << WORDS[:exponents][triple_index].to_s
      end

      number_word = handle_exceptions(number_word)
      number_word = remove_wrong_leadings(number_word)

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