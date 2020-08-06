#lib/connect-four.rb

class ConnectFour

  require_relative 'board2D'
  attr_accessor :game_board

  def initialize
    @MAX_ROW = 6
    @MAX_COL = 7
    @game_board = Board.new(@MAX_ROW, @MAX_COL)
  end


 # Drops player's piece into desired column
  def drop_piece(col, piece)
    row = @MAX_ROW-1

    until @game_board.valid_move?(row, col)
      if row < 0
        return nil
      else
        row -= 1
      end
    end
     @game_board.place_piece(row, col, piece)
     return row, col  #returns piece's location as an array [row, col]
  end

  # Checks if the player has connected four in a column
  def column_win?(row, col)
    piece = @game_board.piece_at(row, col)
    counter = 1
    row += 1
    while row < @MAX_ROW
      if piece == @game_board.piece_at(row, col)
        counter += 1
        row += 1
      else
        break
      end
    end
    return counter == 4
  end

  # Checks if the player has connected four in a row
  def row_win?(row, col)
    piece = @game_board.piece_at(row, col)
    counter = 1

    # Check left
    next_col = col-1
    while next_col >= 0 && counter < 4
      if piece == @game_board.piece_at(row, next_col)
        counter+=1
        next_col-=1
      else
        break
      end
    end

    # Check right
    next_col = col+1
    while next_col < @MAX_COL && counter < 4
      if piece == @game_board.piece_at(row, next_col)
        counter+=1
        next_col+=1
      else
        break
      end
    end
    return counter == 4
  end

  # Checks if the player has connected four on the diagonal
  def diagonal_win?(row, col)
    piece = @game_board.piece_at(row, col)
    counter = 1

    # Left and Up diagonal
    next_col = col-1
    next_row = row-1
    while next_col >=0 && next_row >=0 && counter < 4
      if piece == @game_board.piece_at(next_row, next_col)
        counter+=1
        next_row-=1
        next_col-=1
      else
        break
      end
    end

    # Left and Down diagonal
    next_col = col-1
    next_row = row+1
    while next_col >=0 && next_row < @MAX_ROW && counter < 4
      if piece == @game_board.piece_at(next_row, next_col)
        counter+=1
        next_row+=1
        next_col-=1
      else
        break
      end
    end

    # Right and Up diagonal
    next_col = col+1
    next_row = row-1
    while next_col < @MAX_COL && next_row >= 0 && counter < 4
      if piece == @game_board.piece_at(next_row, next_col)
        counter+=1
        next_row-=1
        next_col+=1
      else
        break
      end
    end

    # Right and Down diagonal
    next_col = col+1
    next_row = row+1
    while next_col < @MAX_COL && next_row < @MAX_ROW && counter < 4
      if piece == @game_board.piece_at(next_row, next_col)
        counter+=1
        next_row+=1
        next_col+=1
      else
        break
      end
    end
    return counter == 4
  end



end  # End of class

game = ConnectFour.new
puts game.game_board
puts

#game.drop_piece(1, "X")
#game.drop_piece(2, "X")
#game.drop_piece(3, "X")
#game.drop_piece(5, "X")
#game.drop_piece(6, "X")
#game.drop_piece(4, "X")
#puts game.game_board
#puts
#puts game.row_win?(5,4)

puts
game.drop_piece(4, "X")
game.drop_piece(5, "X")
game.drop_piece(3, "X")
game.drop_piece(1, "X")
puts game.game_board
puts
puts game.row_win?(5,1)
