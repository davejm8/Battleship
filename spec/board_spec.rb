require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do 

    it 'exists' do
        board = Board.new
    end

    it 'validates cells' do
        board = Board.new
        cell_1 = Cell.new("A1")

        expect(board.valid_coordinate?("A1")).to eq("A1")
    end
end