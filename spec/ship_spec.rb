require 'pry'
require './lib/ship'

RSpec.describe Ship do
    it 'exists' do
        cruiser = Ship.new("Cruiser", 3)
    end
end