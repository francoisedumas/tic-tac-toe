require_relative "tic_tac_toe"

class Interface
  attr_reader :game

  def initialize(tic_tac_toe, bot)
    @bot = bot
    @game = tic_tac_toe
    @winner = "No winner yet"
  end

  def play
    introduction
    first_player = choose_player
    first_position = position(first_player)
    @game.play(first_position, first_player)

    while @winner == "No winner yet"
      display_board
      puts ""

      begin
        @game.play(position, @game.player_turn)
      rescue => e
        puts e.message
        next
      end

      puts @winner = @game.winner?
      puts ""

      exit if @winner != "No winner yet" || (@game.board.grep Integer).none?
    end
  end

  private

  def position(player = nil)
    if @game.player_turn == "X" || player == "X"
      user_position
    else
      @bot.computer_position(@game.board)
    end
  end

  def user_position
    puts "Choose a position to play"
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

  def introduction
    puts "You are the player X"
    puts "This is the board with the positions"
    display_board
    puts "During the game you will be asked to choose a position"
    puts "----------------------"
    puts ""
  end

  def choose_player
    # A bit complex but usefull to have a UX where the user can choose without confusion
    player = { 1 => "X", 2 => "Y"}

    number = ""
    until number == "1" || number == "2"
      puts "Choose 1 to start or 2 to let the computer start"
      number = gets.chomp
    end

    puts "----------------------"
    puts ""

    player[number.to_i]
  end
end
