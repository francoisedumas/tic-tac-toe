class Bot
  WINNING_INDEXES = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  attr_reader :level

  def initialize(level = "easy")
    @level = level
  end

  def computer_position(board)
    case @level
    when "medium"
      medium(board)
    else
      easy(board)
    end
  end

  private

  def easy(board)
    available_position = board.grep Integer
    available_position.sample
  end

  def medium(board)
    # Get available indexes:
    available_indexes = (board.grep Integer).map { |position| position - 1 }

    # Get challenger positions example:
    # ["X", 2, 3, 4, 5, 6, 7, 8, 9] gives [0]
    challenger_indexes = []
    board.each_with_index { |position, index| challenger_indexes << index if position == "X" }

    # Check if challenger is about to win
    indexes_to_play = critical_position(available_indexes, challenger_indexes)
    # if yes, take the position to avoid challenger to win
    return indexes_to_play.first + 1 if indexes_to_play.size == 1

    # else, play randomly
    available_indexes.sample + 1
  end

  def critical_position(available_indexes, challenger_indexes)
    indexes_to_play = []
    WINNING_INDEXES.each do |winning_indexes|
      remaining_indexes = winning_indexes - (winning_indexes & challenger_indexes)
      next if remaining_indexes.size != 1

      indexes_to_play = remaining_indexes & available_indexes
      break if indexes_to_play.size == 1
    end
    indexes_to_play
  end
end
