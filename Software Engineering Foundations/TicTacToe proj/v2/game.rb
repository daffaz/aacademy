require './human_player.rb'
require './board.rb'

class Game
  def initialize(*players)
    @players = players.map { |player| HumanPlayer.new(player) }
    @current_player = @players.first
  end

  def switch_turn
    @current_player = if @players.index(@current_player) == @players.length - 1
                        @players.first
                      else
                        @players[@players.index(@current_player) + 1]
                      end
    # @current_player = @players.rotate!.first
    # Bisa pakai cara rotate
  end

  def play(board_size)
    @board = Board.new(board_size)
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