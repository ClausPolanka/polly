class Listing
  attr_reader :source, :line_numbers, :left_just

  def initialize(source:, line_numbers: nil, left_just: false)
    @source = source
    @line_numbers = line_numbers
    @left_just = left_just
  end

  def lines
    all_lines = source.lines

    subset = if line_numbers
      lines_to_print(all_lines)
    else
      all_lines
    end

    if left_just
      return justify(subset)
    end
    subset
  end

  # "1, #4, 3-4, #6, 15, 37-50"
  def lines_to_print(all_lines)
    specs = line_numbers.gsub(/[‘|’]/, "").gsub(/ /, '').split(",")
    specs.collect { |spec|
      if spec.include?('#')
        num_spaces = spec.delete('#').to_i
        (" " * num_spaces) + "# ..."
      else
        edges = spec.split('-').collect(&:to_i)
        individiual_numbers = (edges.min.to_i..edges.max.to_i).to_a
        individiual_numbers.collect { |i| all_lines[i - 1] }.compact
      end
    }.flatten.compact
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
