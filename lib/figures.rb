require_relative "figures/version"

require_relative "figures/german"

module Figures
  def self.write(number, language_code = :de)
    Figures::German.new(number.to_i).write
  end
end
