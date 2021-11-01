require './human_player.rb'
require './board.rb'

class Game
  def initialize(player_1, player_2)
    @player1 = HumanPlayer.new(player_1)
    @player2 = HumanPlayer.new(player_2)
    @current_player = @player1
  end

  def switch_turn
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play
    @board = Board.new
    while @board.empty_positions?
      @board.print
      pos = @current_player.get_position
      @board.place_mark(pos, @current_player.mark)

      if @board.win?(@current_player.mark)
        return "Victory, #{@current_player.mark} win the game!"
      else
        switch_turn
      end
    end
    'draw'
  end
end