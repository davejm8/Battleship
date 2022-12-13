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
        expect(board.valid_coordinate?("A1")).to eq(true)
        expect(board.valid_coordinate?("D4")).to eq(true)
        expect(board.valid_coordinate?("A5")).to eq(false)
        expect(board.valid_coordinate?("E1")).to eq(false)
        expect(board.valid_coordinate?("A22")).to eq(false)
    end

    it 'valid placement?' do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
        expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)
        expect(board.valid_placement?(submarine, ["B1", "C4"])).to eq(false)
        expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(true)
        expect(board.valid_placement?(cruiser, ["A1", "B1", "C1"])).to eq(true)
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
        expect(board.valid_placement?(cruiser, ["A1", "B1", "D1"])).to eq(false)
        expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    end

    it "can place ship" do 
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        submarine = Ship.new("Submarine", 2)
        board.place(cruiser, ["A1", "A2", "A3"])
        cell_1 = board.cells["A1"]    
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]
        expect(cell_3.ship == cell_1.ship).to eq(true)
    end

    it "can render a ship" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        board.place(cruiser, ["A1", "A2", "A3"])
        cell_1 = board.cells["A1"]    
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]
        cell_4 = board.cells["A4"]
        expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
        expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end

    it "can render hit, miss, sunk, or empty" do
        board = Board.new
        cruiser = Ship.new("Cruiser", 3)
        board.place(cruiser, ["A1", "A2", "A3"])
        cell_1 = board.cells["A1"]    
        cell_2 = board.cells["A2"]
        cell_3 = board.cells["A3"]
        cell_4 = board.cells["A4"]
        expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
        expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
        cell_1.fired_upon
        expect(cruiser.health).to eq(2)
        expect(board.render).to eq("  1 2 3 4 \nA H . . . \nB . . . . \nC . . . . \nD . . . . \n")
        cell_2.fired_upon
        cell_3.fired_upon
        expect(board.render).to eq("  1 2 3 4 \nA X X X . \nB . . . . \nC . . . . \nD . . . . \n")
        cell_4.fired_upon
        expect(board.render).to eq("  1 2 3 4 \nA X X X M \nB . . . . \nC . . . . \nD . . . . \n")
    end
end