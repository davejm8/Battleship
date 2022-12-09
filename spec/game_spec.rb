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
    
        expect(game).to be_an_instance_of(Game)
        game.player_cruiser.hit
        game.player_cruiser.hit
        game.player_cruiser.hit
        game.player_submarine.hit
        game.player_submarine.hit
        game.winner
    end

    it "determines a player win" do
        game = Game.new
    
        expect(game).to be_an_instance_of(Game)
        game.cpu_cruiser.hit
        game.cpu_cruiser.hit
        game.cpu_cruiser.hit
        game.cpu_submarine.hit
        game.cpu_submarine.hit
        game.winner
    end



end