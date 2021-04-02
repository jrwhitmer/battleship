require './lib/ship'
require './lib/cell'
require 'RSpec'

describe Cell do

  it 'can create a cell' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

  it 'has a coordinate' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it 'has a ship' do
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
  end

  it 'can tell us if the cell is empty' do
    cell = Cell.new("B4")

    expect(cell.empty?).to eq(true)
  end

  it 'can place a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    #Possible refactor: Does this need to be two tests?
    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)
  end


  it 'can be fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    # Possible refactor: Law of Demeter violation?
    expect(cell.ship.health).to eq(2)
  end

  it 'can tell if it has been fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    # Possible Refactor: does this need to be two tests?
    expect(cell.fired_upon?).to eq(false)

    cell.fire_upon
    expect(cell.fired_upon?).to eq(true)
  end

  describe '#render' do
    it 'can render when the cell has not been fired upon' do
      cell_1 = Cell.new("B4")

      expect(cell_1.render).to eq(".")
    end

    it 'can render when the cell has been fired upon and misses' do
      cell_1 = Cell.new("B4")
      cell_1.fire_upon

      expect(cell_1.render).to eq("M")
    end

    it 'can render when the cell has a ship' do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)

      expect(cell_2.render).to eq(".")
    end

    it 'can render with an optional ship visibility' do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)

      expect(cell_2.render(true)).to eq("S")
    end

    it 'can render a hit' do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      cell_2.fire_upon

      expect(cell_2.render).to eq("H")
    end

    it 'can render if ship sunk' do
      cell_2 = Cell.new("C3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.place_ship(cruiser)
      cell_2.fire_upon

      expect(cruiser.sunk?).to eq(false)

      cruiser.hit
      cruiser.hit
      # Possible Refactor: Do we need 3 separate tests?
      # Possible Refactor: This test/method needs to change to accommodate multiple cells being fired upon to sink the ship 
      expect(cruiser.sunk?).to eq(true)
      expect(cell_2.render).to eq("X")
    end
  end
end
