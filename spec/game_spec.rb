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

    it "main menu places cpu ships" do
        game = Game.new
        game.main_menu
        expect(game.cpu_cruiser_coordinates).to eq(["C1", "C2", "C3"])
        expect(game.cpu_submarine_coordinates).to eq(["A1", "A2"])
    end

    



end