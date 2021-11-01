class HumanPlayer
  attr_reader :mark

  def initialize(val)
    @mark = val
  end

  def valid_position?(str)
    return false if str.length < 3 || str.split.length > 2 || ('a'..'z').to_a.join.include?(str)

    true
  end

  def get_position(legal_positions)
    pos = nil
    until legal_positions.include?(pos)
      puts "Player #{mark.to_s}, enter two numbers representing a position in the format `row col`"
      pos = gets.chomp.split.map(&:to_i)
      p "#{pos} is not a legal position" unless legal_positions.include?(pos)
      raise 'bad format of position' if pos.length != 2
    end
    pos
  end
end