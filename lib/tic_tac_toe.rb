class TicTacToe
  # Winning positions
  # WINNING_COMBINATIONS = [
  #   %w[V V V - - - - - -],
  #   %w[- - - V V V - - -],
  #   %w[- - - - - - V V V],
  #   %w[V - - V - - V - -],
  #   %w[- V - - V - - V -],
  #   %w[- - V - - V - - V],
  #   %w[V - - - V - - - V],
  #   %w[- - V - V - V - -]
  # ].freeze

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

  attr_reader :board, :last_player

  def initialize
    @board = (1..9).to_a
    @last_player = nil
  end

  def play(position, player)
    validate_position(position)
    validate_player_turn(player)
    validate_position_available(position)

    update_board(position, player)

    @last_player = player
    @board
  end

  def player_turn?(player)
    @last_player != player
  end

  def player_turn
    @last_player == 'X' ? 'Y' : 'X' if @last_player
  end

  def winner?
    return 'Player X wins' if winning_position?(position_indexes('X'))
    return 'Player Y wins' if winning_position?(position_indexes('Y'))

    'No winner yet'
  end

  private

  def validate_position(position)
    raise 'Position not valid' unless position.between?(1, 9)
  end

  def validate_player_turn(player)
    raise "#{player} it's not your turn" unless player_turn?(player)
  end

  def validate_position_available(position)
    raise 'Position not available' if @board[position - 1].is_a?(String)
  end

  def update_board(position, player)
    @board[position - 1] = player
  end

  def position_indexes(player)
    @board.each_index.select { |i| board[i] == player }
  end

  def winning_position?(indexes_array)
    WINNING_INDEXES.any? { |winning_indexes| (winning_indexes - indexes_array).empty? }
  end
end
