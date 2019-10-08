require_relative "Clump"

module Subset

  class Everything
    def lines(everything)
      everything
    end
  end

  class LineNumber

    attr_reader :line_numbers

    def initialize(line_numbers:)
      @line_numbers = line_numbers
    end

    # "1, #4, 3-4, #6, 15, 37-50"
    def lines(possibilities)
      specs = line_numbers.gsub(/[‘|’]/, "").gsub(/ /, '').split(",")
      specs.collect { |spec|
        Clump.lines(spec: spec, possibilities: possibilities)
      }.flatten.compact
    end
  end

end
