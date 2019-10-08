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
        if spec.include?('#')
          num_spaces = spec.delete('#').to_i
          (" " * num_spaces) + "# ..."
        else
          edges = spec.split('-').collect(&:to_i)
          individiual_numbers = (edges.min.to_i..edges.max.to_i).to_a
          individiual_numbers.collect { |i| possibilities[i - 1] }.compact
        end
      }.flatten.compact
    end
  end

end
