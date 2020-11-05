class Board
  attr_accessor :board

  def initialize()
    @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  end

  def rows
    board.each_slice(3).to_a
  end

  def columns
    rows.transpose
  end

  def diagonals
    left_diagonal = ['1', '5', '9']
    right_diagonal = ['3', '5', '7']

    [left_diagonal, right_diagonal]
  end

  def get_token_at(coordinate)
    board[coordinate]
  end

  def set_token_at(coordinate, token)
    board[coordinate] = token
  end

  def reset_token_at(coordinate)
    board[coordinate] = (coordinate + 1).to_s
  end

  def possible_moves
    board.reject { |token| token == 'X' || token == 'O' }
  end

  def row_win?
    rows.each do |row|
      return true if row.uniq == ['X'] || row.uniq == ['O']
    end
    false
  end

  def column_win?
    columns.each do |column|
      return true if column.uniq == ['X'] || column.uniq == ['O']
    end
    false
  end
end
