require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
    it 'exists' do
        cell = Cell.new("B4")
        
        expect(cell).to be_an_instance_of(Cell)
    end
    
    it 'starts empty' do
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

    it 'can be fired upon' do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        # require "pry"; binding.pry
        expect(cell.fired_upon?).to eq(false)
        cell.fired_upon
        expect(cruiser.health).to eq(2)
    end


end