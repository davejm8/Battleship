require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

class Game 
    attr_reader :cpu_board, 
                :player_board, 
                :player_cruiser, 
                :player_submarine, 
                :cpu_cruiser,
                :cpu_submarine
                
    
    def initialize
        @cpu_board = Board.new
        @player_board = Board.new
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
        @cpu_cruiser = Ship.new("Cruiser", 3)
        @cpu_submarine = Ship.new("Submarine", 2)
    end

    def winner
        if @cpu_cruiser.sunk? && @cpu_submarine.sunk? == true
            p"You win!"
        else  @player_cruiser.sunk? && @player_submarine.sunk? == true
            p"You lose"
        end
    end

    def main_menu
        puts "Welcome to Passive-Agressive BattleShip!"
        puts "Enter p to play, I guess. Enter q to quit." 
        input = gets.chomp.downcase
        if input == "p"
            puts "Wow... okay."
        elsif input == "q"
            puts "bye."
        else 
            puts "You probably didn't type p or q."
            main_menu
        end
    end 

    # def turn
        
    # end

    def place_cpu_ships
        cpu_cruiser_coordinates
        @cpu_board.place(@cpu_cruiser, cpu_cruiser_coordinates)
        cpu_submarine_coordinates
        @cpu_board.place(@cpu_submarine, cpu_submarine_coordinates)
        puts @cpu_board.render
    end


    def explanation
        puts "Opponent ships are ready.. or whatever."
        puts "It is your turn to place your ships."
        puts "Obviously your Cruiser occupies 3 consecutive spaces."
        puts "Your Submarine occupies 2 consecutive spaces."
        puts "So like...."
        puts "Have fun, I guess."
        puts @player_board.render(true)
    end

    def cpu_cruiser_coordinates
        ["C1", "C2", "C3"]
        # coordinates = @cpu_board.cells.keys.sample(@cpu_cruiser.length)
        # @cpu_board.valid_placement?(@cpu_cruiser, coordinates) == true
        # coordinates
    
    end


    def cpu_submarine_coordinates
        ["A1", "A2"]
        # coordinates = @cpu_board.cells.keys.sample(@cpu_submarine.length)
        # @cpu_board.valid_placement?(@cpu_submarine, coordinates) == true
        # coordinates
    end
    
    def place_player_cruiser
        puts "Enter the coordinates for the Cruiser(example : A1, A2, A3)."
        loop do
        input = gets.chomp.upcase.split
        puts "#{input}"
            if @player_board.valid_placement?(player_cruiser, input) == true
            @player_board.place(player_cruiser, input)
                break
            else
            puts "Invalid."
            # place_player_cruiser
            end
        end
        
    end
    
    def place_player_submarine
        puts "Enter the coordinates for the Cruiser(example : C1, C2)."
        input = gets.chomp.upcase
        if player_board.valid_placement?(player_submarine, input) == true
            player_board.place(player_submarine, input)
        else
            puts "Invalid."
            place_player_submarine
        end
    end

    def game_start
        main_menu
        place_cpu_ships
        explanation
        place_player_cruiser
        turn_start
    end

    def turn_start
        puts "I guess you can fire."
        until winner do
            display_cpu_board
            display_player_board
            player_shot
            player_results
            cpu_shot
            cpu_results
        end
    end

    def display_player_board
        puts "-----------Player Board----------"
        player_board.render(true)
    end

    def display_cpu_board
        puts "-------------CPU Board------------"
        cpu_board.render
    end


    def player_shot
        puts "You can type the coordinate you want to fire upon, if you want(example: A1)."
        @player_shot = gets.chomp.upcase
        if cpu_board.valid_coordinate?(cell_shot) == true
            cpu_board.cells[cell_shot].fired_upon
        else
            puts "Invalid coordinate. Did you read the example?"
            player_shot
        end
    end

    def cpu_shot
        @computer_shot = "A1"
        if player_board.valid_coordinate?(@computer_shot) == true && player_board.cells[@computer_shot].fired_upon? == false
            player_board.cells[@computer_shot].fired_upon
        end
    end

    def player_results
        if cpu_board.cells[@player_shot].render == "M"
            puts "#{@player_shot} missed. Try again, but better."
        elsif cpu_board.cells[@player_shot].render == "H"
            puts "#{@player_shot} was a hit.. great."
        else cpu_board.cells[@player_shot].render == "X"
            puts "#{@player_shot} sunk a ship. Way to go.."
        end
    end

    def cpu_results
        if player_board.cells[@player_shot].render == "M"
            puts "My shot on #{@cpu_shot} missed."
        elsif player_board.cells[@cpu_shot].render == "H"
            puts "My shot on #{@cpu_shot} was a hit."
        else player_board.cells[@cpu_shot].render == "X"
            puts "My shot on #{@cpu_shot} sunk a ship."
        end
    end


        
    
end