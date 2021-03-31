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
end
