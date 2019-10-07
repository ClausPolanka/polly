require_relative 'GitCmd'
require_relative 'Listing'

listing = Listing.new(
  filename: "code.rb",
  line_numbers: "#0, 2-3, #0, 1",
  repository: "code/.git",
  tag: "test_version",
  git_cmd: GitCmd.new)

puts listing.lines
