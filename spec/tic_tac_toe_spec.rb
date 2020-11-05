require 'board.rb'

describe Board do
  let(:board) { Board.new }

  it "initializes board" do
    expect(board.board).to eq(['0', '1', '2', '3', '4', '5', '6', '7', '8'])
  end

  it "gets the rows" do
    expect(board.rows).to eq([["0", "1", "2"], ["3", "4", "5"], ["6", "7", "8"]])
  end

  it "gets the columns" do
    expect(board.columns).to eq([["0", "3", "6"], ["1", "4", "7"], ["2", "5", "8"]])
  end

  it "gets the diagonals" do
    expect(board.diagonals).to eq([["0", "4", "8"], ["2", "4", "6"]])
  end
end
