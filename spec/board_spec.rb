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


  context 'can tell us if ship is correctly placed' do
    it 'can test if the number of coordinates is equal to the length of the ship' do
     board = Board.new
     cruiser = Ship.new("Cruiser", 3)
     submarine = Ship.new("Submarine", 2)

     expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
     expect(board.valid_placement?(submarine, ["A1", "A2", "A3"])).to eq(false)
    end

    it 'can test if the placement coordinates are consecutive' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
    end

    it 'can test if the placement coordinates are not diagonal' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    end

    it 'passes all of the previous tests for valid placement' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end

end
