module Justification
  class None
    def justify(lines)
      lines
    end
  end

  class BlockLeft
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
end
