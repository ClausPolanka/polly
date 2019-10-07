class Listing
  attr_reader :filename, :line_numbers, :repository, :tag, :git_cmd

  def initialize(filename:, line_numbers: nil, repository: nil, tag: nil, git_cmd: nil)
    @filename = filename
    @line_numbers = line_numbers
    @repository = repository
    @tag = tag
    @git_cmd = git_cmd
  end

  def lines
    all_lines = if git_cmd
      git_lines
    else
      file_lines
    end

    if line_numbers
      return lines_to_print(all_lines)
    end
    all_lines
  end

  def git_lines
    git_cmd.repository = repository
    git_cmd.tagname = tag
    git_cmd.filename = filename
    git_cmd.show.split("\n")
  end

  def file_lines
    File.read("code/code.rb").split("\n")
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
end
