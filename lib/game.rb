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
        place_player_cruiser
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
        input = gets.chomp.upcase
        if player_board.valid_placement?(player_cruiser, input) == true
            player_board.place(player_cruiser, input)
        else
            puts "Invalid."
            place_player_submarine
        end
    end
    
    def place_player_submarine
        puts "Enter the coordinates for the Cruiser(example : C1, C2)."
        input = gets.chomp.upcase
        if player_board.valid_placement?(player_submarine, input) == true
            player_board.place(player_submarine, input)
        else
            puts "Invalid."
            # turn_start
        end
    end

    def turn_start
        puts "I guess you can fire."
        until winner do
            method to display cpu
            method to display player
            type valid cell
            fire upon valid cell
            results H M X
            computer picks cell to fire upon
            computer fires
            results H M X
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
        cell_shot = gets.chomp.upcase
        if cpu_board.valid_coordinate?(cell_shot) == true
            cpu_board.cells[cell_shot].fired_upon
        else
            puts "Invalid coordinate. Did you read the example?"
            player_shot
        end
    end

    def cpu_shot
        cell_shot = "A1"
        if player_board.valid_coordinate?(cell_shot) == true && player_board.cells[cell_shot].fired_upon? == false
            player_board.cells[cell_shot].fired_upon
        end
    end

    def player_results
        if reveal_ship == true && empty? == false
            return "S"
        elsif fired_upon? == true && empty? == true
            return "M"
        else fired_upon? == true && empty? == false && @ship.sunk? == false
            return "H"
        end
    end
        
    
end