require 'board.rb'

describe Board do
  let(:board) { Board.new }

  it "initializes board" do
    expect(board.board).to eq(['1', '2', '3', '4', '5', '6', '7', '8', '9'])
  end

  it "gets the rows" do
    expect(board.rows).to eq([["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]])
  end

  it "gets the columns" do
    expect(board.columns).to eq([["1", "4", "7"], ["2", "5", "8"], ["3", "6", "9"]])
  end

  it "gets the diagonals" do
    expect(board.diagonals).to eq([["1", "5", "9"], ["3", "5", "7"]])
  end

  it "gets token at a coordinate" do
    expect(board.get_token_at(0)).to eq('1')
  end

  it "sets token at a coordinate" do
    expect(board.set_token_at(0, 'X')).to eq("X")
  end
end
