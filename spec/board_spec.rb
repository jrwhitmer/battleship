require './lib/board'
require './lib/cell'
require 'RSpec'

describe 'Board' do

  it 'can create a board' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it 'can have cells' do
    board = Board.new

    expect(board.cells.length).to eq(16)
    expect(board.cells.values.first).to be_instance_of(Cell)
  end

  it 'can test if coordinate is valid' do
    board = Board.new

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
  end
end
