require_relative "lib/interface"
require_relative "lib/bot"

tic_tac_toe = TicTacToe.new
difficulty = ""
until difficulty == "easy" || difficulty == "medium"
  puts "Choose your difficulty from easy or medium"
  difficulty = gets.chomp
end
bot = Bot.new(difficulty)
game = Interface.new(tic_tac_toe, bot)
game.play
