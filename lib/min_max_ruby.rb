# bot is "X" and player is "Y"

class MinMax
  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def initialize
  end

  def minimax(board, current_player)
    return score(board) if game_over?(board)
    scores = [] # an array of scores
    moves = []  # an array of moves

    # Populate the scores array, recursing as needed
    get_all_empty_cells_indexes(board).each do |move|
      possible_game = board.dup
      possible_game[move] = current_player
      if current_player == "X"
        scores.push minimax(board, "Y")
        moves.push move
      else
        scores.push minimax(board, "X")
        moves.push move
      end
    end

    # Do the min or the max calculation
    if current_player == "X"
      # This is the max calculation
      max_score_index = scores.each_with_index.max[1]
      return scores[max_score_index]
    else
      # This is the min calculation
      min_score_index = scores.each_with_index.min[1]
      return scores[min_score_index]
    end
  end

  private

  # Step 4 - Create a function to get the indexes of all the empty cells:
  def get_all_empty_cells_indexes(board)
    board.each_index.select { |index| board[index] != "Y" && board[index] != "X" }
  end

  # Step 5 - Create a winner determiner function:
  def check_if_winner_found(board, player)
    WINNING_COMBINATIONS.any? do |a, b, c|
      board[a] == player && board[b] == player && board[c] == player
    end
  end

  def score(board)
    # If bot X wins, return 10
    if check_if_winner_found(board, "X")
      10
    # If human Y wins, return -10
    elsif check_if_winner_found(board, "Y")
      -10
    else
      0
    end
  end

  def game_over?(board)
    win?(board) || tie?(board)
  end

  def win?(board)
    check_if_winner_found(board, "X") || check_if_winner_found(board, "Y")
  end

  def tie?(board)
    board.grep(Integer).empty?
  end
end

ai = MinMax.new
current_board_state = ["X", "X", 2, "Y", "Y", 5, 6, 7, 8]
# current_board_state = ["X", 1, "Y", "X", 4, "X", "Y", "Y", 8]
best_move = ai.minimax(current_board_state, "X")
p best_move
