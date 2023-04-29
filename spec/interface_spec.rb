require "interface"

RSpec.describe Interface do
  subject(:interface) { described_class.new }

  it "can access the board" do
    expect(interface.game.board).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end
end
