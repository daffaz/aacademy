class HumanPlayer
  attr_reader :mark

  def initialize(val)
    @mark = val
  end

  def valid_position?(str)
    return false if str.length < 3 || str.split.length > 2 || ('a'..'z').to_a.join.include?(str)

    true
  end

  def get_position
    puts "Player #{mark.to_s}, enter two numbers representing a position in the format `row col`"
    input = gets.chomp
    raise 'bad format of position' unless valid_position?(input)

    input.split.map(&:to_i)
  end
end