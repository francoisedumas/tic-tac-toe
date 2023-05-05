class TicTacToe
  attr_reader :board, :last_player

  WINNING_COMBINATIONS = [
    ["V", "V", "V", "-", "-", "-", "-", "-", "-"],
    ["-", "-", "-", "V", "V", "V", "-", "-", "-"],
    ["-", "-", "-", "-", "-", "-", "V", "V", "V"],
    ["V", "-", "-", "V", "-", "-", "V", "-", "-"],
    ["-", "V", "-", "-", "V", "-", "-", "V", "-"],
    ["-", "-", "V", "-", "-", "V", "-", "-", "V"]
  ]

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @last_player = nil
  end

  def play(position, player)
    raise "Position not valid" if position > 9 || position < 1
    raise "#{player} it's not your turn" unless player_turn?(player)
    raise "Position not available" if @board[position - 1].is_a?(String)
    @board[position - 1] = player
    @last_player = player
    @board
  end

  def player_turn?(player)
    @last_player != player
  end

  def player_turn
    return nil if @last_player.nil?

    @last_player == "X" ? "Y" : "X"
  end

  def winner?
    challenger_array = @board.map { |elem| elem == "X" ? "V" : "-" }
    return "Player X win" if WINNING_COMBINATIONS.include?(challenger_array)
    challenger_array = @board.map { |elem| elem == "Y" ? "V" : "-" }
    return "Player Y win" if WINNING_COMBINATIONS.include?(challenger_array)
    "No winner yet"
  end
end
