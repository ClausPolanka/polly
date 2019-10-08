require_relative 'GitCmd'
require_relative 'Listing'
require_relative 'GitTagSource'
require_relative 'Subset'

listing = Listing.new(
  source: GitTagSource.new(
    filename: "code.rb",
    repository: "code/.git",
    tag: "test_version_java",
    git_cmd: GitCmd.new),
    subsetter: Subset::LineNumber.new(line_numbers: "#0, 2-3, #0, 1"),
  left_just: true)

puts listing.lines
