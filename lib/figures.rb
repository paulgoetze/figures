require_relative "figures/version"
require_relative "figures/german"

module Figures
  def self.parse(number, language_code = :de)
    Figures::German.new(number).parse
  end
end
