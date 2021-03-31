require './lib/ship'

describe Ship do
  it 'can create a ship' do
    cruiser = Ship.new('Cruiser', 3)
    expect(cruiser).to be_instance_of(Ship)
  end
end
