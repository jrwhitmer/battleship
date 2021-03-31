require './lib/ship'
require './lib/cell'
require 'RSpec'

describe Cell do

  it 'can create a cell' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

end
