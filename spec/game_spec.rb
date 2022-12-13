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
        game.place_cpu_ships
        expect(game.cpu_cruiser_coordinates).to eq(["C1", "C2", "C3"])
        expect(game.cpu_submarine_coordinates).to eq(["A1", "A2"])
    end

    it "player can fire on cpu board" do
        game = Game.new
        expect(game.cpu_board.cells["A1"].fired_upon?).to eq(false)
        game.cpu_board.cells["A1"].fired_upon
        expect(game.cpu_board.cells["A1"].fired_upon?).to eq(true)
    end

    it "cpu can fire" do
        game = Game.new
        game.player_board.place(@player_cruiser, ["A1", "A2", "A3"])
        expect(game.player_board.cells["A1"].fired_upon?).to eq(false)
        game.cpu_shot
        expect(game.player_board.cells["A1"].fired_upon?).to eq(true)
    end

    



end