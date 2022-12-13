# For our pair project we picked battleship. Using TDD we created 4 
# classes each with their own test files and a runner file to run the 
# program.
# ruby runner.rb
# 
class Ship
   
    attr_reader :name,
                :length,
                :health
    def initialize(name, length)
        @name = name
        @length = length
        @health = length
    end     

    def hit
        if @health > 0
            @health -= 1
        end
    end

    def sunk?
        health == 0
    end
end

