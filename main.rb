require_relative 'GitCmd'
require_relative 'Listing'
require_relative 'GitTagSource'
require_relative 'Subset'
require_relative 'FileSource'
require_relative 'Justification'

listing = Listing.new(
  source: GitTagSource.new(
    filename: "Hello.java",
    repository: "code/.git",
    tag: "test_version_java_with_correct_identation",
    git_cmd: GitCmd.new),
  subsetter: Subset::LineNumber.new(line_numbers: "#0, 2-3, #0, 1"),
  justifier: Justification::BlockLeft.new)

puts listing.lines

puts "========================================================="
puts "========================================================="


listing = Listing.new(
  source: FileSource.new,
  subsetter: Subset::LineNumber.new(line_numbers: "#0, 2-3, #0, 1"),
  justifier: Justification::None.new)

puts listing.lines
