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
    while @winner == "No winner yet"
      position = gets.chomp.to_i
      @game.play(position, "X")
      display_board
      puts @winner = @game.winner?
      exit if @winner != "No winner yet" || (@game.board.grep Integer).none?
      computer_position = @bot.computer_position(@game.board)
      @game.play(computer_position, "Y")
      display_board
      puts @winner = @game.winner?
      exit if (@game.board.grep Integer).none?
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
