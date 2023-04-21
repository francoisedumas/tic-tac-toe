require "tic_tac_toe"

RSpec.describe TicTacToe do
  subject(:tic_tac_toe) { described_class.new }

  it "generates an board with the position" do
    expect(tic_tac_toe.board).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "should have a X in position 1 when player X plays position 1" do
    expect(tic_tac_toe.play(1, "X")).to eq(["X", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "should have a O in position 1 when player O plays position 9" do
    expect(tic_tac_toe.play(1, "O")).to eq(["O", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  context "when a position is already taken" do
    before { tic_tac_toe.play(1, "X") }

    it "returns an error" do
      expect { tic_tac_toe.play(1, "O") }.to raise_error("Position not available")
    end
  end
end
