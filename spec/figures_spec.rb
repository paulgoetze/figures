require_relative "../lib/figures"
require "minitest/autorun"

describe Figures do
  describe '.write' do
    describe '[german]' do
      it 'parses -1' do
        assert_equal 'minus eins', Figures.write(-1, :de)
      end

      it 'parses 0' do
        assert_equal 'null', Figures.write(0, :de)
      end

      it 'parses 1' do
        assert_equal 'eins', Figures.write(1, :de)
      end

      it 'parses 2' do
        assert_equal 'zwei', Figures.write(2, :de)
      end

      it 'parses 3' do
        assert_equal 'drei', Figures.write(3, :de)
      end

      it 'parses 4' do
        assert_equal 'vier', Figures.write(4, :de)
      end

      it 'parses 5' do
        assert_equal 'fünf', Figures.write(5, :de)
      end

      it 'parses 6' do
        assert_equal 'sechs', Figures.write(6, :de)
      end

      it 'parses 7' do
        assert_equal 'sieben', Figures.write(7, :de)
      end

      it 'parses 8' do
        assert_equal 'acht', Figures.write(8, :de)
      end

      it 'parses 9' do
        assert_equal 'neun', Figures.write(9, :de)
      end

      it 'parses 10' do
        assert_equal 'zehn', Figures.write(10, :de)
      end

      it 'parses 11' do
        assert_equal 'elf', Figures.write(11, :de)
      end

      it 'parses 12' do
        assert_equal 'zwölf', Figures.write(12, :de)
      end

      it 'parses 13' do
        assert_equal 'dreizehn', Figures.write(13, :de)
      end

      it 'parses 14' do
        assert_equal 'vierzehn', Figures.write(14, :de)
      end

      it 'parses 15' do
        assert_equal 'fünfzehn', Figures.write(15, :de)
      end

      it 'parses 16' do
        assert_equal 'sechzehn', Figures.write(16, :de)
      end

      it 'parses 17' do
        assert_equal 'siebzehn', Figures.write(17, :de)
      end

      it 'parses 18' do
        assert_equal 'achtzehn', Figures.write(18, :de)
      end

      it 'parses 19' do
        assert_equal 'neunzehn', Figures.write(19, :de)
      end

      it 'parses 20' do
        assert_equal 'zwanzig', Figures.write(20, :de)
      end

      it 'parses 21' do
        assert_equal 'einundzwanzig', Figures.write(21, :de)
      end

      it 'parses 30' do
        assert_equal 'dreißig', Figures.write(30, :de)
      end

      it 'parses 99' do
        assert_equal 'neunundneunzig', Figures.write(99, :de)
      end

      it 'parses 100' do
        assert_equal 'einhundert', Figures.write(100, :de)
      end

      it 'parses 101' do
        assert_equal 'einhunderteins', Figures.write(101, :de)
      end

      it 'parses 199' do
        assert_equal 'einhundertneunundneunzig', Figures.write(199, :de)
      end

      it 'parses 200' do
        assert_equal 'zweihundert', Figures.write(200, :de)
      end

      it 'parses 999' do
        assert_equal 'neunhundertneunundneunzig', Figures.write(999, :de)
      end

      it 'parses 1_000' do
        assert_equal 'eintausend', Figures.write(1000, :de)
      end

      it 'parses 1_234' do
        assert_equal 'eintausendzweihundertvierunddreißig', Figures.write(1_234, :de)
      end

      it 'parses 10_000' do
        assert_equal 'zehntausend', Figures.write(10_000, :de)
      end

      it 'parses 100_000' do
        assert_equal 'einhunderttausend', Figures.write(100_000, :de)
      end

      it 'parses 1_000_000' do
        assert_equal 'eine Million', Figures.write(1_000_000, :de)
      end

      it 'parses 1_000_001' do
        assert_equal 'eine Million eins', Figures.write(1_000_001, :de)
      end

      it 'parses 2_000_000' do
        assert_equal 'zwei Millionen', Figures.write(2_000_000, :de)
      end
    end
  end
end

