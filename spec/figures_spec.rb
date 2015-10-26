require_relative "../lib/figures"
require "minitest/autorun"

describe Figures do
  describe '.parse' do
    it 'parses 1234' do
      input = 1234
      output = 'eintausendzweihundertvierunddreißig'
      assert_equal Figures.parse(input), output
    end
  end
end

