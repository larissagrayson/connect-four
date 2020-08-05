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

  end

  # Checks if the player has connected four on the diagonal
  def diagonal_win?
  end

  # Checks if the player has connected four vertically
  def vertical_win?(row, col)
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

  # Checks if the player has connected four horizontally
  def horizontal_win?
    columns = @game_board.get_columns
  end



end

game = ConnectFour.new
puts game.game_board
puts

4.times { game.drop_piece(3, "X") }
puts game.game_board
puts
result  = game.vertical_win?(2,3)
puts result
