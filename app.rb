require_relative "lib/interface"

tic_tac_toe = TicTacToe.new
game = Interface.new(tic_tac_toe)
game.play
