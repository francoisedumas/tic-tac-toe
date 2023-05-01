require_relative "lib/interface"
require_relative "lib/bot"

tic_tac_toe = TicTacToe.new
bot = Bot.new
game = Interface.new(tic_tac_toe, bot)
game.play
