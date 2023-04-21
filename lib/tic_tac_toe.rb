class TicTacToe
  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def play(position, player)
    raise "Position not available" if @board[position - 1].is_a?(String)
    @board[position - 1] = player
    @board
  end
end
