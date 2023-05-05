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
    puts ">"
    @game.play(position, "X")
    while @winner == "No winner yet"
      display_board
      begin
        @game.play(position, @game.player_turn)
      rescue => e
        puts e.message
        next
      end
      p @game.board
      puts @winner = @game.winner?
      exit if @winner != "No winner yet" || (@game.board.grep Integer).none?
    end
  end

  private

  def position
    return gets.chomp.to_i if @game.player_turn.nil?

    if @game.player_turn == "X"
      puts ">"
      gets.chomp.to_i
    else
      @bot.computer_position(@game.board)
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
