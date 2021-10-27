require_relative "board"
require_relative "player"

class Battleship
  attr_reader :player, :board, :remaining_misses
  # @param [Integer] n
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = board.size / 2
  end

  def start_game
    board.place_random_ships
    p "there is #{board.num_ships} ships on board"
    board.print
  end

  def lose?
    if remaining_misses <= 0
      p 'you lose'
      true
    else
      false
    end
  end

  def win?
    if board.num_ships.positive?
      false
    else
      p 'you win'
      true
    end
  end

  def game_over?
    win? || lose? ? true : false
  end

  def turn
    pos = player.get_move
    attack = board.attack(pos)

    @remaining_misses -= 1 unless attack
    p board.print
    p remaining_misses
  end
end
