require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

RSpec.describe Game do
    it "exists" do

        game = Game.new
        require 'pry'; binding.pry
        # @player_cruiser = Ship.new("Crusier", 3)
        # @player_submerine = Ship.new("submerine", 2)
        # @cpu_cruiser = Ship.new("Crusier", 3)
        # @cpu_submerine = Ship.new("submerine", 2)
        
        expect(game).to be_an_instance_of(Game)
        game.player_cruiser.hit
        game.player_cruiser.hit
        game.player_cruiser.hit
        game.player_submarine.hit
        player_submarine.hit
        game.winner

        
    end
end