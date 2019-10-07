class Listing
  attr_reader :filename, :repository, :tag, :git_cmd

  def initialize(filename:, repository: nil, tag: nil, git_cmd: nil)
    @filename = filename
    @repository = repository
    @tag = tag
    @git_cmd = git_cmd
  end

  def lines
    if git_cmd
      git_cmd.repository = repository
      git_cmd.tagname = tag
      git_cmd.filename = filename
      git_cmd.show.split("\n")
    else
      "From file: " + File.read("code/code.rb").split("\n")
    end
  end
end
