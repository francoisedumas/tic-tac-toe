require "bot"

RSpec.describe Bot do
  subject(:bot) { described_class.new }

  describe "#computer_position" do
    it "returns an available position" do
      board = ["X", "X", 3, "Y", "Y", 6, 7, 8, 9]
      expect([3, 6, 7, 8, 9].include?(bot.computer_position(board))).to be(true)
    end
  end
end
