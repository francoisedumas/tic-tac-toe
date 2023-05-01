class Bot
  def computer_position(board)
    available_position = board.grep Integer
    available_position.sample
  end
end
