require_relative 'constants'

class Bot
  include GameConstants

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
    board.grep(Integer).sample
  end

  def medium(board)
    # Get available indexes:
    available_indexes = (board.grep Integer).map { |position| position - 1 }

    # Get challenger positions example:
    # ["X", 2, 3, 4, 5, 6, 7, 8, 9] gives [0]
    challenger_indexes = board.each_index.select { |index| board[index] == "X" }

    # Get bot positions example:
    # ["X", 2, "Y", 4, 5, 6, 7, 8, 9] gives [3]
    bot_indexes = board.each_index.select { |index| board[index] == "Y" }

    # Check if bot can win
    winning_indexes = indexes_to_play(available_indexes, bot_indexes)
    # if yes, take the position to win
    return winning_indexes.first + 1 if winning_indexes.one?

    # Check if challenger is about to win
    indexes_to_play = indexes_to_play(available_indexes, challenger_indexes)
    # if yes, take the position to avoid challenger to win
    return indexes_to_play.first + 1 if indexes_to_play.one?

    # else, play randomly
    available_indexes.sample + 1
  end

  def indexes_to_play(available_indexes, player_indexes)
    indexes_to_play = []
    WINNING_INDEXES.each do |winning_indexes|
      remaining_indexes = winning_indexes - (winning_indexes & player_indexes)
      next if remaining_indexes.size != 1

      indexes_to_play = remaining_indexes & available_indexes
      break if indexes_to_play.one?
    end
    indexes_to_play
  end
end
