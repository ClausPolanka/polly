class FileSource
  def lines
    File.read("code/code.rb").split("\n")
  end
end
