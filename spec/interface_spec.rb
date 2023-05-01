require "interface"
# Here the let bot return nil as I don't require the Bot class
# but as I don't check if not is really initialize in the Interface class it works
# bummer!! need to improve this!

RSpec.describe Interface do
  subject(:interface) { described_class.new(tic_tac_toe, bot) }
  let(:tic_tac_toe) { TicTacToe.new }
  let(:bot) { Bot.new }

  it "can access the board" do
    expect(interface.game.board).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end
end
