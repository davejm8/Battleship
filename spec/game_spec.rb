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

    it "has a main menu" do
        game = Game.new
        game.main_menu
        
        expect(game.main_menu).to include("Welcome to BattleShip!")
        
        
    end



end