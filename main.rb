require_relative 'GitCmd'
require_relative 'Listing'

listing = Listing.new(
  filename: "Hello.java",
  left_just: true,
  repository: "code/.git",
  tag: "test_version_java",
  git_cmd: GitCmd.new)

puts listing.lines
