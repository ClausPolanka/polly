class Listing

  attr_reader :source, :subsetter, :justifier

  def initialize(source:, subsetter:, justifier:)
    @source = source
    @subsetter = subsetter
    @justifier = justifier
  end

  def lines
    justifier.justify(subsetter.lines(source.lines))
  end

end
