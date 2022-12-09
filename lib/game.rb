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
                if input = "q"
                    puts "later NERD!"
                elsif input = "p"
                end #place ships / invalid input
            end 

        end

        def place_cpu_cruiser
            game.player_board.cells.keys.sample(2)
            if cpu_cruiser.valid_placement? == true
                
                
            end
            # if statment valid_placement


        end

        def place_player_cruiser

    end
end