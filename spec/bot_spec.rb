require "bot"

RSpec.describe Bot do
  subject(:bot) { described_class.new }

  describe "#computer_position" do
    it "returns an available position" do
      board = ["X", "X", 3, "Y", "Y", 6, 7, 8, 9]
      expect([3, 6, 7, 8, 9]).to include(bot.computer_position(board))
    end

    context "when passed medium level" do
      subject(:bot) { described_class.new("medium") }

      it "returns 3, to avoid losing" do
        board = ["X", "X", 3, "Y", 5, 6, 7, 8, 9]
        expect(bot.computer_position(board)).to eq(3)
      end

      it "returns 2 or 4" do
        board = ["X", 2, "X", 4, "Y", 6,"X", 8, "Y"]
        expect([2, 4]).to include(bot.computer_position(board))
      end

      it "returns 7, to avoid losing" do
        board = ["X", "Y", 3, "X", "X", "Y", 7, 8, 9]
        expect([7, 9].include?(bot.computer_position(board))).to be(true)
        expect([7, 9]).to include(bot.computer_position(board))
      end

      it "should choose to win" do
        board = ["X", "X", 3, "Y", "Y", 6, 7, 8, 9]
        expect(bot.computer_position(board)).to eq(6)
      end
    end
  end

  describe "#level" do
    it "returns by default an easy bot level" do
      expect(bot.level).to eq("easy")
    end

    context "when passed medium level" do
      subject(:bot) { described_class.new("medium") }

      it "returns a medium bot level" do
        expect(bot.level).to eq("medium")
      end
    end
  end
end
