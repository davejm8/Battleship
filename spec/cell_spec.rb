require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    it 'exists' do
        cell = Cell.new("B4")
        
        expect(cell).to be_an_instance_of(Cell)
    end
    
    it 'can be empty' do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        expect(cell.empty?).to eq(true)
    end

    it 'can have a ship' do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        # require "pry"; binding.pry
        expect(cell.place_ship(cruiser)).to eq(cruiser)
        
        
    end

end