require_relative 'GitCmd'
require_relative 'Listing'

listing = Listing.new(
  filename: "code.rb",
  repository: "code/.git",
  tag: "test_version",
  git_cmd: GitCmd.new)

puts listing.lines
