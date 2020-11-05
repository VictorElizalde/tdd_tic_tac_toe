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
    left_diagonal = [board[0], board[4], board[8]]
    right_diagonal = [board[2], board[4], board[6]]

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

  def diagonal_win?
    diagonals.each do |diagonal|
      return true if diagonal.uniq == ['X'] || diagonal.uniq == ['O']
    end
    false
  end

  def winner?
    row_win? || column_win? || diagonal_win?
  end

  def tie?
    possible_moves.length.zero? && !winner?
  end

  def game_over?
    winner? || possible_moves.length.zero?
  end

  def winner
    rows.each do |row|
      return row.uniq.first if row.uniq.length == 1
    end

    columns.each do |column|
      return column.uniq.first if column.uniq.length == 1
    end

    diagonals.each do |diagonal|
      return diagonal.uniq.first if diagonal.uniq.length == 1
    end
  end
end
