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
    return winning_indexes.first + 1 if winning_indexes.any?

    # Check if challenger is about to win
    indexes_to_play = indexes_to_play(available_indexes, challenger_indexes)
    # if yes, take the position to avoid challenger to win

    indexes_to_play.any? ? indexes_to_play.sample + 1 : initializer(board)
  end

  def indexes_to_play(available_indexes, player_indexes)
    return available_indexes if available_indexes.one?
    indexes_to_play = []
    WINNING_INDEXES.each do |winning_indexes|
      remaining_indexes = winning_indexes - (winning_indexes & player_indexes)
      next if remaining_indexes.size != 1

      indexes_to_play << remaining_indexes & available_indexes if (remaining_indexes & available_indexes).any?
    end
    indexes_to_play.flatten
  end

  def initializer(board)
    # First time to play for the bot take the middle position if available
    # if not take a corner
    # See challenging pattern in the notes
    board[4].is_a?(Integer) ? 5 : [1, 3, 7, 9].sample
  end
end
