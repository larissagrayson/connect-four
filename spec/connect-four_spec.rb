#spec/connect-four_spec.rb

require './lib/connect-four'
require './lib/board2D'

describe Board do
  board = Board.new(6,7)

  describe "#is_full?" do
    it "Returns false if the board is not full" do
      expect(board.is_full?).to be false
    end
  end

  describe "#valid_move?" do
    it "Returns true if the move is valid" do
    #  board = Board.new(6,7)
      expect(board.valid_move?(1,1)).to be true
    end

    it "Returns false if the move is invalid" do
      #board = Board.new(6,7)
      expect(board.valid_move?(1,7)).to be false
    end
  end

  describe "#place_piece" do
    it "Places given piece at desired row, col" do
      board.place_piece(1,1, "X")
      expect(board.piece_at(1,1)).to eq "X"
    end
  end
end

describe ConnectFour do

  describe "#drop_piece" do
    it "Drops piece into bottom of cage for an empty column" do
      connect_four = ConnectFour.new
      connect_four.drop_piece(5, "X")
      expect(connect_four.game_board.piece_at(5,5)).to eq "X"
    end
    it "Drops piece into a column with another piece" do
      connect_four = ConnectFour.new
      3.times { connect_four.drop_piece(3, "X") }
      expect(connect_four.game_board.piece_at(3,3)).to eq "X"
    end
  end

  describe "#column_win" do
    it "Returns true when 4 of the same piece are in a column" do
      connect_four = ConnectFour.new
      4.times { connect_four.drop_piece(3, "X") }
      expect(connect_four.column_win?(2,3)).to be true
    end
    it "Returns false when 4 are non-contiguous in a column" do
      connect_four = ConnectFour.new
      3.times { connect_four.drop_piece(2, "X") }
      connect_four.game_board.place_piece(1,2, "X")
      expect(connect_four.column_win?(1,2)).to be false
    end
  end

  describe "#row_win" do
    it "Returns true when 4 of the same piece are in a row" do
      connect_four = ConnectFour.new
      connect_four.drop_piece(1, "X")
      connect_four.drop_piece(2, "X")
      connect_four.drop_piece(3, "X")
      connect_four.drop_piece(5, "X")
      connect_four.drop_piece(6, "X")
      connect_four.drop_piece(4, "X")
      expect(connect_four.row_win?(5,4)).to be true
    end
    it "Returns false when 4 are non-contiguous in a row" do
      connect_four = ConnectFour.new
      connect_four.drop_piece(4, "X")
      connect_four.drop_piece(5, "X")
      connect_four.drop_piece(3, "X")
      connect_four.drop_piece(1, "X")
      expect(connect_four.row_win?(5,1)).to be false
    end
  end

end
