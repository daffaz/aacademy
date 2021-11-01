class ComputerPlayer
  attr_reader :mark

  def initialize(val)
    @mark = val
  end

  def valid_position?(str)
    return false if str.length < 3 || str.split.length > 2 || ('a'..'z').to_a.join.include?(str)

    true
  end

  def get_position(legal_positions)
    comp = legal_positions.sample
    puts "Computer #{mark}, choose position #{comp}"
    comp
  end
end