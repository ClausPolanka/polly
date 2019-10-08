class Clump

  attr_reader :spec, :possibilities

  def initialize(spec:, possibilities:)
    @spec = spec
    @possibilities = possibilities
  end

  class Comment < Clump
    def lines
      num_spaces = spec.delete('#').to_i
      (" " * num_spaces) + "# ..."
    end
  end

  class LineNumber < Clump
    def lines
      edges = spec.split('-').collect(&:to_i)
      individiual_numbers = (edges.min.to_i..edges.max.to_i).to_a
      individiual_numbers.collect { |i| possibilities[i - 1] }.compact
    end
  end

  def self.lines(spec:, possibilities: [])
    self.for(spec: spec, possibilities: possibilities).lines
  end

  def self.for(spec:, possibilities: [])
    if spec.include?('#')
      Clump::Comment
    else
      Clump::LineNumber
    end.new(spec: spec, possibilities: possibilities)
  end
end
