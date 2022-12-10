require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

RSpec.describe Game do
    it "exists" do
        game = Game.new
        
        expect(game).to be_an_instance_of(Game)
    end


    it "determines a player loss" do
        game = Game.new
        game.player_cruiser.hit
        game.player_cruiser.hit
        game.player_cruiser.hit
        game.player_submarine.hit
        game.player_submarine.hit
        game.winner

        expect(game.winner).to eq("You lose")
    end

    it "places cpu ships" do
        game = Game.new
        game.place_cpu_ships
        cell_1 = game.cells["A1"]    
        cell_2 = game.cells["A2"]
        cell_3 = game.cells["A3"]
        expect(cell_3.ship == cell_1.ship).to eq(true)
        
    end



end