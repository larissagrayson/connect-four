# Board class as a 2D Array

class Board
  attr_accessor :board

  def initialize(row, col)
    @MAX_ROW = row
    @MAX_COL = col
    @board = Array.new(@MAX_ROW) {Array.new(@MAX_COL, " ")}
  end

  # Prints the board as a string
  def to_s
    str = String.new
    @board.each do |row|
      str += "|"
      row.each do |space|
        str += space
        str += "|"
      end
    str += "\n"
    end
    str
  end

  # Checks if any empty spaces are found in the array
  def is_full?
    @board.each do |row|
      if row.any?(" ") == true
        return false
      else
        return true
      end
    end
  end

  # Checks if the requested move location is open and valid
  def valid_move?(row, col)
    if row < 0 || row > @MAX_ROW
      return false
    elsif col < 0 || col > @MAX_COL
      return false
    elsif @board[row][col] != " "
      return false
    else
      return true
    end
  end

  # Place the piece in the given location
  def place_piece(row, col, piece)
    if valid_move?(row, col)
      @board[row][col] = piece
    else
      return "Error! not a valid move, space is already taken..."
    end
  end

  # Returns the piece at the given location
  def piece_at(row, col)
    return @board[row][col]
  end


  def get_columns
    @board.transpose
  end



end

b = Board.new(6,7)
#puts b
#print b.is_full?
#puts b.valid_move?(-1,0)
#b.place_piece(1,1, "X")
#puts b
#piece = b.piece_at(1,1)
#puts piece
b.place_piece(0,1, "X")
puts b
cols = b.get_columns
print cols[1]
