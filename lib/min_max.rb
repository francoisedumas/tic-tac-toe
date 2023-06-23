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

  def minimax(board, curr_mark)
    avail_cells_indexes = get_all_empty_cells_indexes(board)

    if check_if_winner_found(board, "Y")
      { score: -1 }
    elsif check_if_winner_found(board, "X")
      { score: 1 }
    elsif avail_cells_indexes.empty?
      { score: 0 }
    else
      all_test_play_infos = []

      avail_cells_indexes.each do |index|
        current_test_play_info = {}
        current_test_play_info[:index] = board[index]
        board[index] = curr_mark

        if curr_mark == "X"
          result = minimax(board, "Y")
          current_test_play_info[:score] = result[:score]
        else
          result = minimax(board, "X")
          current_test_play_info[:score] = result[:score]
        end

        board[index] = current_test_play_info[:index]
        all_test_play_infos.push(current_test_play_info)
      end

      best_test_play = nil

      if curr_mark == "X"
        best_score = -Float::INFINITY
        all_test_play_infos.each_with_index do |play_info, i|
          if play_info[:score] > best_score
            best_score = play_info[:score]
            best_test_play = i
          end
        end
      else
        best_score = Float::INFINITY
        all_test_play_infos.each_with_index do |play_info, i|
          if play_info[:score] < best_score
            best_score = play_info[:score]
            best_test_play = i
          end
        end
      end
      # p all_test_play_infos
      return all_test_play_infos[best_test_play]
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
end

ai = MinMax.new
current_board_state = ["X", "X", 2, "Y", "Y", 5, 6, 7, 8]
# current_board_state = ["X", 1, "Y", "X", 4, "X", "Y", "Y", 8]
best_move = ai.minimax(current_board_state, "X")
p best_move
p best_move[:index]
