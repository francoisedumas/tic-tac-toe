require_relative "tic_tac_toe"

class Interface
  attr_reader :game

  def initialize(tic_tac_toe, bot)
    @bot = bot
    @game = tic_tac_toe
    @winner = "No winner yet"
  end

  def play
    puts "Welcome to Tic Tac Toe"
    puts "You are the player X"
    display_board
    puts "Player X, please choose a position"
    @game.play(position, "X")
    while @winner == "No winner yet"
      begin
        @game.play(position, @game.player_turn)
      rescue => e
        puts e.message
        next
      end
      display_board
      puts @winner = @game.winner?
      exit if @winner != "No winner yet" || (@game.board.grep Integer).none?
    end
  end

  private

  def position
    if @game.player_turn == "X" || @game.player_turn.nil?
      user_position
    else
      @bot.computer_position(@game.board)
    end
  end

  def user_position
    puts ">"
    begin
      input = gets.chomp
      Integer(input)
    rescue ArgumentError
      puts "Invalid input: #{input} is not a number"
      retry
    end
  end

  def display_board
    board = @game.board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
end
