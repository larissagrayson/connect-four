#spec/connect-four_spec.rb

require './lib/connect-four'

describe ConnectFour do
  describe "#space_available?" do
    it "Returns true if space is open" do
      connect_four = ConnectFour.new
      expect(connect_four.space_available?(1)).to be true
    end
  end

  describe "#drop_piece" do
    it "Places piece at the bottom of cage for an empty column" do
      connect_four = ConnectFour.new
      expect(connect_four.space_available?(41)).to be true
      connect_four.drop_piece('X', 6)
      expect(connect_four.space_available?(41)).to be false
    end

    it "Places piece on top of an existing piece" do
      connect_four = ConnectFour.new
      connect_four.drop_piece('X', 3)
      expect(connect_four.space_available?(38)).to be false
      connect_four.drop_piece('X', 3)
      expect(connect_four.space_available?(31)).to be false
      expect(connect_four.space_available?(24)).to be true
    end
  end

  describe "row_win?" do
    it "Returns true if player has 4 consecutive pieces" do
      connect_four = ConnectFour.new
      connect_four.drop_piece('x', 36)
      connect_four.drop_piece('x', 37)
      connect_four.drop_piece('x', 38)
      expect(connect_four.row_win?).to be false
      connect_four.drop_piece('x', 39)
      expect(connect_four.row_win?).to be true
    end
  end
end
