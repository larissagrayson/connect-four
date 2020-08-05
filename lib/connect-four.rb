#lib/connect-four.rb

class ConnectFour

  require_relative 'board'

  def initialize
    @MAX_ROW = 6
    @MAX_COL = 7
    @game_board = Board.new(@MAX_ROW, @MAX_COL)

  end



  # Checks if the space the piece would fall into is open
  def space_available?(desired_move)
    @game_board.valid_move?(desired_move)
  end

 # Drops player's piece into desired column
  def drop_piece(piece, column)
    bottom_row = @MAX_COL * @MAX_ROW
    desired_move = bottom_row - (@MAX_COL - column)
      while desired_move > 0
        if space_available?(desired_move)
          @game_board.place_piece(desired_move, piece)
          break
        else
          desired_move = (desired_move - @MAX_COL)
        end
      end
  end

  # Checks if the player has connected four on the diagonal
  def diagonal_win?
  end

  # Checks if the player has connected four vertically
  def vertical_win?
  end

  # Checks if the player has connected four horizontally
  def row_win?

    columns = @game_board.get_columns

  end

  # Prints the game board
  def print
    puts @game_board
  end

end

game = ConnectFour.new
game.print
puts
game.drop_piece('X', 6)
game.print
puts
puts game.space_available?(40)
game.drop_piece('X', 6)
game.print
puts
game.drop_piece('X', 6)
game.print
puts
game.drop_piece('X', 6)
game.print
puts
game.drop_piece('X', 6)
game.print
puts
game.drop_piece('X', 6)
game.print
puts
game.drop_piece('X', 6)
game.print
puts
print game.row_win?
