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
      expect(board.valid_placement?(cruiser, ["C1", "B1", "A1"])).to eq(false)
    end

    it 'can test if the placement coordinates are not diagonal' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["D1", "C2"])).to eq(false)
    end

    it 'passes all of the previous tests for valid placement' do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
    end
  end

  it 'can place a ship' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cell_2.ship)
  end

  it 'does not place overlapping ships' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
  end

  it 'can render the board' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    expect(board.render).to eq("  1 2 3 4 \n" +
                               "A  . . . . \n" +
                               "B  . . . . \n" +
                               "C  . . . . \n" +
                               "D  . . . . \n")
    expect(board.render(true)).to eq("  1 2 3 4 \n" +
                                     "A  S S S . \n" +
                                     "B  . . . . \n" +
                                     "C  . . . . \n" +
                                     "D  . . . . \n")
  end
end
