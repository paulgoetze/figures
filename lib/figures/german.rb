module Figures
  class German

    UNITS   = %w{ eins zwei drei vier fünf sechs sieben acht neun }.freeze

    PREFIXES = {
      units:          %w{ tausend mi bi tri quadri quinti sexti septi okti noni },
      union_units:    %w{ un duo tre quattuor quinqua se septe okto nove },
      union_tens:     %{ dezi viginti triginta quadraginta quinquaginta sexaginta septuaginta oktoginta nonaginta },
      union_hundreds: %w{ zenti duzenti trezenti quadringenti quingenti seszenti septingenti oktingenti nongenti }
    }.freeze

    EXCEPTIONS = {
      /^eins(hundert|tausend)/ => 'ein\1',
      /^eins\s/    => 'eine ',
      'einszehn'   => 'elf',
      'zweizehn'   => 'zwölf',
      'sechszehn'  => 'sechzehn',
      'siebenzehn' => 'siebzehn',
      'zweizig'    => 'zwanzig',
      'dreizig'    => 'dreißig',
      'sechszig'   => 'sechzig',
      'siebenzig'  => 'siebzig'
    }.freeze

    attr_reader :number

    def initialize(number)
      @number = number.to_i
    end

    def parse
      return 'null' if number == 0

      triples = split_into_reverse_triples(number)

      word = triples.each_with_index.reduce('') do |result, (triple, index)|
        triple_word = triple_to_word(triple, index)
        result.prepend(triple_word)
      end

      number < 0 ? "minus #{word}" : word
    end

    private

    def triples_count
      @triples_count ||= split_into_reverse_triples(number).count
    end

    def split_into_reverse_triples(number)
      @reverse_triples ||= number.abs.to_s.reverse.scan(/.{1,3}/).map(&:reverse)
    end

    def triple_to_word(triple, triple_index)
      hundred_digit, ten_digit, unit_digit = split_triple(triple)

      word = [
        hundred(hundred_digit),
        unit(unit_digit),
        copula(unit_digit, ten_digit),
        ten(ten_digit)
      ].join

      word = append_exponent_identifier(word, triple_index)
      cleanup_exceptions(word)
    end

    # splits up a triple into hundreds, tens and unit position
    def split_triple(triple)
      triple.match(/\A(\d)??(\d)??(\d)\z/).captures.map(&:to_i)
    end

    # returns the word for the given unit number
    def unit(digit)
      return '' if digit.zero?
      UNITS[digit - 1]
    end

    # returns the copula between unit position and tens
    def copula(unit_digit, ten_digit)
      'und' if ten_digit > 1 && !unit_digit.zero?
    end

    # returns the word for the given tens digit
    def ten(digit)
      case digit
      when 0 then ''
      when 1 then 'zehn'
      else unit(digit) + 'zig'
      end
    end

    # returns the word for the given hundreds number
    def hundred(digit)
      case digit
      when 0 then ''
      else unit(digit) + 'hundert'
      end
    end

    # adds the exponent word to the triple word
    # e.g. tausend for the second triple   (index = 1)
    #      Million for the third triple    (index = 2)
    #      Milliarde for the fourth triple (index = 3)
    #
    #      indexes => PREFIXES index
    #      2,3 => 1; 4,5 => 2; 6,7 => 3; ... : floored division by 2
    # etc.
    def append_exponent_identifier(word, index)
      return word if word.empty? || index.zero? || triples_count == 1

      if index == 1
        word + PREFIXES[:units][0]
      elsif index.even?
        word + ' ' + (PREFIXES[:units][index / 2] + 'llion ').capitalize.strip
      elsif index.odd?
        plural_form = (word =~ /^eins/) ? '' : 'n'
        word + ' ' + (PREFIXES[:units][index / 2] + "lliarde#{plural_form} ").capitalize.strip
      end
    end

    # replaces all exceptions in the number word
    def cleanup_exceptions(word)
      EXCEPTIONS.each do |exception, replacement|
        word.sub!(exception, replacement)
      end

      word
    end

  end
end