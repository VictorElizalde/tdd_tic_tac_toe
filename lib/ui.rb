class UI
  def display_board(board)
    playing_board = ''
    playing_board << " #{board.board[0]} | #{board.board[1]} | #{board.board[2]} "
    playing_board << "\n-----------\n"
    playing_board << " #{board.board[3]} | #{board.board[4]} | #{board.board[5]} "
    playing_board << "\n-----------\n"
    playing_board << " #{board.board[6]} | #{board.board[7]} | #{board.board[8]} "
    playing_board
    puts playing_board
  end

  def print_winner(board)
    puts "#{board.winner} won"
  end

  def print_tie
    puts 'Tie'
  end

  def receive_token_location
    puts 'Select coordinate between 0 and 8'
    gets.chomp
  end
end
