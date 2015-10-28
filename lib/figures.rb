require "figures/version"
require "figures/german"

module Figures

  def self.parse(number, language_code = :de)
    Figures::German.new(number).parse
  end
end
