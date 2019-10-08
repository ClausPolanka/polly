require_relative "Subset"

class Listing

  attr_reader :source, :subsetter, :left_just

  def initialize(source:, subsetter:,left_just: false)
    @source = source
    @subsetter = subsetter
    @left_just = left_just
  end

  def lines
    subset = subsetter.lines(source.lines)

    if left_just
      return justify(subset)
    end
    subset
  end

  def justify(lines)
    lines.map { |line| line.slice(num_leading_spaces_to_remove(lines)..-1) || "" }
  end

  def num_leading_spaces_to_remove(lines)
    @num ||=
      lines.reduce(999999) { |current_min, line|
        line.empty? ? current_min : [current_min, num_leading_spaces(line)].min
      }
  end

  def num_leading_spaces(line)
    line[/\A */].size
  end

end
