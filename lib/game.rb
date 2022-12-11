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
        @player_cruiser = Ship.new("Crusier", 3)
        @player_submarine = Ship.new("submerine", 2)
        @cpu_cruiser = Ship.new("Crusier", 3)
        @cpu_submarine = Ship.new("submerine", 2)
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
        if input = "p"
            place_cpu_ships
            puts "Wow... okay."
        elsif input = "q"
            puts "bye."
        else 
            puts "You probably didn't type p or q."
            main_menu
        end
    end 

    def place_cpu_ships
        cpu_cruiser_coordinates
        @cpu_board.place(@cpu_cruiser, cpu_cruiser_coordinates)
        cpu_submarine_coordinates
        @cpu_board.place(@cpu_submarine, cpu_submarine_coordinates)
        puts @cpu_board.render
        explaination
    end


    def explaination
        puts "Opponent ships are ready.. or whatever."
        puts "It is your turn to place your ships."
        puts "Obviously your Cruiser occupies 3 consecutive spaces."
        puts "Your Submarine occupies 2 consecutive spaces."
        puts "So like...."
        puts "Have fun, I guess."
        puts @player_board.render(true)
        player_cruiser
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
    


    

        
    
end