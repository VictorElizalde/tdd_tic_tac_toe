require 'board.rb'
require 'ui.rb'
require 'player.rb'
require 'human.rb'

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

  it "resets token at a coordinate" do
    expect(board.reset_token_at(0)).to eq("1")
  end

  it "returns possible moves in board" do
    board.set_token_at(0, 'X')
    expect(board.possible_moves).to eq(["2", "3", "4", "5", "6", "7", "8", "9"])
  end

  it "checks if a player won with a row combination" do
    expect(board.row_win?).to eq(false)
  end

  it "returns true because of row combination" do
    board.set_token_at(0, 'X')
    board.set_token_at(1, 'X')
    board.set_token_at(2, 'X')
    expect(board.row_win?).to eq(true)
  end

  it "checks if a player won with a column combination" do
    expect(board.column_win?).to eq(false)
  end

  it "returns true because of column combination" do
    board.set_token_at(0, 'X')
    board.set_token_at(3, 'X')
    board.set_token_at(6, 'X')
    expect(board.column_win?).to eq(true)
  end

  it "checks if a player won with a diagonal combination" do
    expect(board.diagonal_win?).to eq(false)
  end

  it "returns true because of diagonal combination" do
    board.set_token_at(0, 'X')
    board.set_token_at(4, 'X')
    board.set_token_at(8, 'X')
    expect(board.diagonal_win?).to eq(true)
  end

  it "returns true if a winner exists in any combination" do
    expect(board.winner?).to eq(false)
  end

  it "returns true if a winner exists in row" do
    board.set_token_at(0, 'X')
    board.set_token_at(1, 'X')
    board.set_token_at(2, 'X')
    expect(board.winner?).to eq(true)
  end

  it "returns true if a winner exists in column" do
    board.set_token_at(0, 'X')
    board.set_token_at(3, 'X')
    board.set_token_at(6, 'X')
    expect(board.winner?).to eq(true)
  end

  it "returns true if a winner exists in diagonal" do
    board.set_token_at(0, 'X')
    board.set_token_at(4, 'X')
    board.set_token_at(8, 'X')
    expect(board.winner?).to eq(true)
  end

  it "returns true if no winner exists and board is complete" do
    board.board = %w(O X X
                     X X O
                     O O X)
    expect(board.tie?).to eq(true)
  end

  it "checks if the game is over" do
    expect(board.game_over?).to eq(false)
  end

  it "returns true when game is over" do
    board.board = %w(X X O
                     O X X
                     X O O)
    expect(board.game_over?).to eq(true)
  end

  it "tells the winner token X" do
    board.board = %w(X X X
                     O X O
                     O O X)
    expect(board.winner).to eq('X')
  end

  it "tells the winner token X" do
    board.board = %w(O X X
                     O X O
                     O O X)
    expect(board.winner).to eq('O')
  end
end

describe UI do
  let(:ui) { UI.new }
  let(:board) { Board.new }

  it 'prints board' do
    expect { ui.display_board(board) }.to output(" 1 | 2 | 3 \n-----------\n 4 | 5 | 6\n-----------\n 7 | 8 | 9\n").to_stdout
  end

  it 'prints tie for tie game' do
    board.board = %w(X X O
                     O O X
                     X O O)
    expect { ui.print_tie }.to output("Tie\n").to_stdout
  end

  it 'prints the winner of TTT' do
    board.board = %w(X X X
                     O O X
                     X O O)
    expect { ui.print_winner(board) }.to output("X won\n").to_stdout
  end
end

describe Player do
  let(:player) { Player.new('X') }

  it 'is initialized with a token' do
    expect(player.token).to eq('X')
  end

  it 'is initialized with an enemy token' do
    expect(player.enemy_token).to eq('O')
  end
end

describe Human do
  let(:board) { Board.new }
  let(:human) { Human.new('X') }

  it 'is initialized with a token' do
    expect(human.token).to eq('X')
  end

  it 'has an enemy' do
    expect(human.enemy_token).to eq('O')
  end

  it 'makes a move in a location' do
    human.move(board, 0)
    expect(board.get_token_at(0)).to eq('X')
  end
end
