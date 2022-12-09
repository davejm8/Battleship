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



        # def play
        #     require 'pry'; binding.pry
        #     until player1.ships.all.sunk?
        #     end

           


      #  end
    end
end