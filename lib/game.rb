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
        puts "Welcome to BattleShip!"
        puts "Enter p to play. Enter q to quit." 
        input = gets.chomp.downcase
        if input = "p"
            place_cpu_ships
            puts "READY.... FIGHT!"
        elsif input = "q"
            puts "later NERD!"
        else 
            puts "Invalid input: Please try again."
            main_menu
        end
    end 


    def cpu_cruiser_coordinates
        coordinates = @cpu_board.cells.keys.sample(@cpu_cruiser.length)
        @cpu_board.valid_placement?(@cpu_cruiser, coordinates) == true
        coordinates
    
    end


    def cpu_submarine_coordinates
        coordinates = @cpu_board.cells.keys.sample(@cpu_submarine.length)
        @cpu_board.valid_placement?(@cpu_submarine, coordinates) == true
        coordinates
        
    end
    
    # def cpu_cruiser_cord
    #    ["A1", "A2", "A3"]
        
    #     # # if cpu_cruiser.valid_placement? == true
    #     # if cpu_board.valid_placement?(cpu_cruiser, random_cord) == true
    #     #     random_cord
    #     # else
    #     #     cpu_cruiser_coord
    #     # end
    # end

    # def cpu_submarine_cord
    #     ["B1", "B2"]
    # end
        

    # def place_cpu_ships
    #     cpu_cruiser_cord
    #     cpu_submarine_cord
    #     cpu_board.place(cpu_cruiser, cpu_cruiser_cord)
    #     cpu_board.place(cpu_submarine, cpu_submarine_cord)
    #     puts cpu_board.render

    # end



    

        
    
end