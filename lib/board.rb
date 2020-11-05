class Board
  attr_accessor :board

  def initialize()
    @board = ['0', '1', '2', '3', '4', '5', '6', '7', '8']
  end

  def rows
    board.each_slice(3).to_a
  end

  def columns
    rows.transpose
  end
end
