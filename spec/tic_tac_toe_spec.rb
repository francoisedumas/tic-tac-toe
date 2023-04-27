require "tic_tac_toe"

RSpec.describe TicTacToe do
  subject(:tic_tac_toe) { described_class.new }

  it "generates an board with the position" do
    expect(tic_tac_toe.board).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "should have a X in position 1 when player X plays position 1" do
    expect(tic_tac_toe.play(1, "X")).to eq(["X", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "should have a Y in position 1 when player Y plays position 1" do
    expect(tic_tac_toe.play(1, "Y")).to eq(["Y", 2, 3, 4, 5, 6, 7, 8, 9])
  end

  it "should raise an error if position is over 9" do
    expect { tic_tac_toe.play(10, "Y") }.to raise_error("Position not valid")
  end

  it "should raise an error if position is below 0" do
    expect { tic_tac_toe.play(0, "Y") }.to raise_error("Position not valid")
  end

  context "when a position is already taken" do
    before { tic_tac_toe.play(1, "X") }

    it "returns an error" do
      expect { tic_tac_toe.play(1, "Y") }.to raise_error("Position not available")
    end
  end

  context "when a player plays" do
    before { tic_tac_toe.play(1, "X") }

    it "returns an error if the player is playing 2 times in a row" do
      expect { tic_tac_toe.play(2, "X") }.to raise_error("It's not your turn")
    end

    it "returns the correct board if the players play in alternance" do
      expect(tic_tac_toe.play(2, "Y")).to eq(["X", "Y", 3, 4, 5, 6, 7, 8, 9])
    end
  end
end
