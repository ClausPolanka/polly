class GitCmd
  attr_accessor :repository, :tagname, :filename

  def show
    `git #{git_dir} show #{tagname}:#{filename}`
  end

  private
  def git_dir
    %Q[--git-dir="#{repository}"]
  end
end
