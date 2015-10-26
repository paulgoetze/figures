require_relative "../lib/figures"
require "minitest/autorun"

describe Figures do
  describe '.parse' do
    describe '[german]' do
      it 'parses -1' do
        assert_equal 'minus eins', Figures.parse(-1, :de)
      end

      it 'parses 0' do
        assert_equal 'null', Figures.parse(0, :de)
      end

      it 'parses 1' do
        assert_equal 'eins', Figures.parse(1, :de)
      end

      it 'parses 2' do
        assert_equal 'zwei', Figures.parse(2, :de)
      end

      it 'parses 3' do
        assert_equal 'drei', Figures.parse(3, :de)
      end

      it 'parses 4' do
        assert_equal 'vier', Figures.parse(4, :de)
      end

      it 'parses 5' do
        assert_equal 'fünf', Figures.parse(5, :de)
      end

      it 'parses 6' do
        assert_equal 'sechs', Figures.parse(6, :de)
      end

      it 'parses 7' do
        assert_equal 'sieben', Figures.parse(7, :de)
      end

      it 'parses 8' do
        assert_equal 'acht', Figures.parse(8, :de)
      end

      it 'parses 9' do
        assert_equal 'neun', Figures.parse(9, :de)
      end

      it 'parses 10' do
        assert_equal 'zehn', Figures.parse(10, :de)
      end

      it 'parses 11' do
        assert_equal 'elf', Figures.parse(11, :de)
      end

      it 'parses 12' do
        assert_equal 'zwölf', Figures.parse(12, :de)
      end

      it 'parses 13' do
        assert_equal 'dreizehn', Figures.parse(13, :de)
      end

      it 'parses 14' do
        assert_equal 'vierzehn', Figures.parse(14, :de)
      end

      it 'parses 15' do
        assert_equal 'fünfzehn', Figures.parse(15, :de)
      end

      it 'parses 16' do
        assert_equal 'sechzehn', Figures.parse(16, :de)
      end

      it 'parses 17' do
        assert_equal 'siebzehn', Figures.parse(17, :de)
      end

      it 'parses 18' do
        assert_equal 'achtzehn', Figures.parse(18, :de)
      end

      it 'parses 19' do
        assert_equal 'neunzehn', Figures.parse(19, :de)
      end

      it 'parses 20' do
        assert_equal 'zwanzig', Figures.parse(20, :de)
      end

      it 'parses 21' do
        assert_equal 'einundzwanzig', Figures.parse(21, :de)
      end

      it 'parses 30' do
        assert_equal 'dreißig', Figures.parse(30, :de)
      end

      it 'parses 99' do
        assert_equal 'neunundneunzig', Figures.parse(99, :de)
      end

      it 'parses 100' do
        assert_equal 'einhundert', Figures.parse(100, :de)
      end

      it 'parses 101' do
        assert_equal 'einhunderteins', Figures.parse(101, :de)
      end

      it 'parses 199' do
        assert_equal 'einhundertneunundneunzig', Figures.parse(199, :de)
      end

      it 'parses 200' do
        assert_equal 'zweihundert', Figures.parse(200, :de)
      end

      it 'parses 999' do
        assert_equal 'neunhundertneunundneunzig', Figures.parse(999, :de)
      end

      it 'parses 1_000' do
        assert_equal 'eintausend', Figures.parse(1000, :de)
      end

      it 'parses 1_234' do
        assert_equal 'eintausendzweihundertvierunddreißig', Figures.parse(1_234, :de)
      end

      it 'parses 10_000' do
        assert_equal 'zehntausend', Figures.parse(10_000, :de)
      end

      it 'parses 100_000' do
        assert_equal 'einhunderttausend', Figures.parse(100_000, :de)
      end

      it 'parses 1_000_000' do
        assert_equal 'million', Figures.parse(1_000_000, :de)
      end

      it 'parses 2_000_000' do
        assert_equal 'zwei millionen', Figures.parse(1_000_000, :de)
      end
    end
  end
end

