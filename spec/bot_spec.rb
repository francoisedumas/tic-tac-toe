require "bot"

RSpec.describe Bot do
  subject(:bot) { described_class.new }

  describe "#computer_position" do
    it "returns an available position" do
      board = ["X", "X", 3, "Y", "Y", 6, 7, 8, 9]
      expect([3, 6, 7, 8, 9].include?(bot.computer_position(board))).to be(true)
    end

    context "when passed medium level" do
      subject(:bot) { described_class.new("medium") }

      it "returns 2 ou 4" do
        board = ["X", 2, 3, 4, 5, 6, 7, 8, 9]
        expect([2, 4].include?(bot.computer_position(board))).to be(true)
      end

      it "returns 2 ou 4 ou 6 ou 8" do
        board = [1, 2, 3, 4, "X", 6, 7, 8, 9]
        expect([2, 4, 6, 8].include?(bot.computer_position(board))).to be(true)
      end

      it "returns 3" do
        board = ["X", "X", 3, "Y", 5, 6, 7, 8, 9]
        expect(bot.computer_position(board)).to eq(3)
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
