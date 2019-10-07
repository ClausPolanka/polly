require_relative 'GitCmd'
require_relative 'Listing'

listing = Listing.new(
  filename: "code.rb",
  line_numbers: "2-3, 1",
  repository: "code/.git",
  tag: "test_version")

puts listing.lines
