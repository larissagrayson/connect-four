#lib/connect-four.rb

class ConnectFour

  require_relative 'board2D'
  attr_accessor :game_board

  def initialize
    @MAX_ROW = 6
    @MAX_COL = 7
    @board_title = "|A |B |C |D |E |F |G | \n~~~~~~~~~~~~~~~~~~~~~~ \n"
    @game_board = Board.new(@MAX_ROW, @MAX_COL, @board_title)
    @valid_columns = %w[A B C D E F G]
    @game_is_over = false
    @player1_piece = "\u{26AA}"  # open circle
    @player2_piece = "\u{26AB}"  # closed circle
    @current_player = nil
    @current_piece = nil
  end


  def play_game
    game_start_message
    until @game_is_over
      if @current_player == nil || @current_player == 2
        @current_player = 1
        @current_piece = @player1_piece
      else
        @current_player = 2
        @current_piece = @player2_piece
      end

      desired_move = -1
      until valid_column_selected?(desired_move)
        print "Player #{@current_player}, where would you like to drop your piece? "
        desired_move = gets.chomp.upcase
        if !valid_column_selected?(desired_move)
          puts "Invalid selection!!"
        end
      end
      column = @valid_columns.index(desired_move)
      location = drop_piece(column, @current_piece)
      puts @game_board
      if check_for_win(location[0], location[1])
        @game_is_over = true
        break
      end
    end

    if @game_is_over
      game_over_message
      play_again?
    end
  end

  def game_start_message
    print "CONNECT FOUR \n"
    puts "Player 1 -- #{@player1_piece}, Player 2 -- #{@player2_piece}"
    puts "Please select the column that you want to drop your piece into..."
    puts @game_board
  end


  # Checks if the user input was valid
  def valid_column_selected?(col_letter)
    col_num = @valid_columns.index(col_letter)
    return @valid_columns.include?(col_letter) &&  @game_board.valid_move?(0,col_num)
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

  # Checks if there is a win from the given row, col
  def check_for_win(row, col)
    return column_win?(row,col) || row_win?(row,col) || diagonal_win?(row,col)
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
    while next_col >= 0 && next_row < @MAX_ROW && counter < 4
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

  def game_over_message
    puts "GAME OVER"
    if @game_board.is_full?
      puts "It's a draw!"
    elsif @current_player == 1
      puts "Player 1 won!"
    else
      puts "Player 2 won!"
    end
  end

  def play_again?
    response = nil
    until response == "Y"  || response =="N"
      print "Would you like to play again? "
      response = gets.chomp.upcase
    end
    if response == "Y"
      initialize
      play_game
    else
      exit
    end
  end
end  # End of class

game = ConnectFour.new
game.play_game
