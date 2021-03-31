require './lib/ship'

describe Ship do
  it 'can create a ship' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser).to be_instance_of(Ship)
  end

  it 'can tell us its name' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser.name).to eq('Cruiser')
  end

  it 'can tell us its length' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser.length).to eq(3)
  end

  it 'can tell us its health' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser.health).to eq(3)
  end
  it 'can tell us if it has sunk' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser.sunk?).to eq(false)
    cruiser.hit
    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
  end

  it 'can get hit' do
    cruiser = Ship.new('Cruiser', 3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end
end
