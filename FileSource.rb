class FileSource
  def lines
    File.read("code/Hello.java").split("\n")
  end
end
