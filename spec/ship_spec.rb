require 'pry'
require './lib/ship'

RSpec.describe Ship do
    it 'exists' do
        cruiser = Ship.new("Cruiser", 3)
        
        expect(cruiser).to be_an_instance_of(Ship)
    end


    it 'has readable attributes' do
        cruiser = Ship.new("Cruiser", 3)
        expect(cruiser.name).to eq("Cruiser")
        expect(cruiser.length).to eq(3)
        expect(cruiser.health).to eq(3)
    end

    it 'can get hit' do
        cruiser = Ship.new("Cruiser", 3)
        
        cruiser.hit
        expect(cruiser.health).to eq(2)
        cruiser.hit
        expect(cruiser.health).to eq(1)

    end

    it 'can be sank' do
        cruiser = Ship.new("Cruiser", 3)
        expect(cruiser.sunk?).to equal(false)
        3.times do cruiser.hit
        end
        expect(cruiser.sunk?).to equal(true)
    end
end