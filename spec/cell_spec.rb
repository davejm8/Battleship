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
        expect(cell.place_ship(cruiser)).to eq(cruiser)
    end

    it 'can be fired upon' do
        cell = Cell.new("B4")
        cruiser = Ship.new("Cruiser", 3)
        cell.place_ship(cruiser)
        expect(cell.fired_upon?).to eq(false)
        cell.fired_upon
        expect(cruiser.health).to eq(2)
        expect(cell.fired_upon?).to eq(true)
    end

    it 'can render a cell' do
        cell_1 = Cell.new("B4")
        cell_2 = Cell.new("C3")
        cruiser = Ship.new("Cruiser", 3)
        expect(cell_1.render).to eq(".")
        cell_1.fired_upon
        expect(cell_1.render).to eq("M")
        cell_2.place_ship(cruiser)
        expect(cell_2.render).to eq(".")
        expect(cell_2.render(true)).to eq("S")
        cell_2.fired_upon
        expect(cell_2.render).to eq("H")
        expect(cruiser.sunk?).to eq(false)
        cruiser.hit
        cruiser.hit
        expect(cruiser.sunk?).to eq(true)
        expect(cell_2.render).to eq("X")
    end

end