class Board
  attr_accessor :board

  def initialize(row, col)
    @MAX_ROW = row
    @MAX_COL = col
    @board = Array.new(@MAX_ROW * @MAX_COL){" "}
  end

  # prints the board to the console
  def to_s
    string = String.new
    row = 0
    while row < @MAX_ROW
      col = 0
      while col < @MAX_COL
         current_space = (row * @MAX_COL) + col
         string += " #{@board[current_space]} |"
         col += 1
       end
       row +=1
       string += "\n"
      end
    return string
  end

  def is_full?
    # Checks if any 0's are found in the array, if yes, return false
    # else returns true
    if @board.any?(" ") == true
      return false
    else
      return true
    end
  end

  # check if the requested location is valid
  def valid_move?(location)
    # if the location is not blank, or if it's less than 0 or greater than board size -1, it's not valid
    if @board[location] != " " || location < 0 || location >= @board.size
      return false
    else
      return true
    end
  end

  # place the piece in the given location
  def place_piece(location, piece)

    if valid_move?(location)
      @board[location] = piece
    else
      return "Error! not a valid move, space is already taken..."
    end
  end

  def piece_at(location)
    return @board[location]
  end

  def get_columns
    @board
  end

end
