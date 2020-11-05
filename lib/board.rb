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
end
