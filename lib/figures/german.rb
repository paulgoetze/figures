module Figures
  class German
    WORDS = {
      copula: "und",
      zero: "null",
      single: "eins",
      one: "eine",
      first10: [""] + %w[
        ein
        zwei
        drei
        vier
        fünf
        sechs
        sieben
        acht
        neun
      ],
      second10: %w[
        zehn
        elf
        zwölf
        dreizehn
        vierzehn
        fünfzehn
        sechzehn
        siebzehn
        achtzehn
        neunzehn
      ],
      tens: %w[
        zwanzig
        dreißig
        vierzig
        fünfzig
        sechzig
        siebzig
        achzig
        neunzig
      ],
      hundred: 'hundert',
      thousand: 'tausend',
      huge: %w[
        Million
        Milliarde
        Billion
        Billiarde
        Trillion
        Trilliarde
        Quadrillion
        Quadrilliarde
        Quintillion
        Sextillion
        Sextilliarde
      ]
    }

    def initialize(number)
      @number = number
    end

    def write
      return WORDS[:zero] if @number == 0
      number_string = @number.to_s.reverse.scan(/.{1,3}/).map.with_index{ |number_part, index|
        write_triple(number_part.reverse.to_i, index)
      }.reverse.join.strip

      if @number < 0
        "minus #{number_string}"
      else
        number_string
      end
    end

    def write_triple(number, triple_index)
      hundred, ten, one = number.abs.to_s.match(/\A(\d)??(\d)??(\d)\z/).captures.map(&:to_i)
      result = ""

      is_empty    = hundred == 0 && ten == 0 && one == 0
      is_thousand = !is_empty && triple_index == 1

      if hundred && hundred != 0
        result << WORDS[:first10][hundred] + WORDS[:hundred]
      end

      if !ten
        result << WORDS[:first10][one]
      elsif ten == 0
        if !is_thousand && hundred && one == 1
          if triple_index > 1
            result << WORDS[:one]
          else
            result << WORDS[:single]
          end
        else
          result << WORDS[:first10][one]
        end
      elsif ten == 1
        result << WORDS[:second10][one]
      else
        result << WORDS[:first10][one]
        result << WORDS[:copula] unless one == 0
        result << WORDS[:tens][ten - 2]
      end

      if is_thousand
        result << WORDS[:thousand]
      elsif triple_index > 1 && !is_empty
        huge = WORDS[:huge][triple_index - 2].dup
        huge[/e?$/] = "en" unless one == 1
        result << " #{huge} "
      end

      result
    end
  end
end