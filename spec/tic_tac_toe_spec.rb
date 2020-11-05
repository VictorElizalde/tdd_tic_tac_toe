require 'board.rb'

describe Board do
  let(:board) { Board.new }

  it "initializes board" do
    expect(board.board).to eq(['0', '1', '2', '3', '4', '5', '6', '7', '8'])
  end

  it "gets the rows" do
    expect(board.rows).to eq([["0", "1", "2"], ["3", "4", "5"], ["6", "7", "8"]])
  end
end
