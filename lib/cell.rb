class Cell
    attr_reader :coordinate,
                :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = ship
        @fired_upon = false
    end

    def empty?
        @ship == nil
    end

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon
        @fired_upon = true
        if @ship.nil? == false
            @ship.hit
        end
        # @ship.hit if !@ship.nil?
        # @ship.hit unless @ship.nil?
    end

    def fired_upon?
        @fired_upon
    end

    def render(reveal_ship = false)
        if reveal_ship == true && empty? == false
            return "S"
        elsif fired_upon? == true && empty? == true
            return "M"
        elsif fired_upon? == true && empty? == false && @ship.sunk? == false
            return "H"
        elsif fired_upon? == true && empty? == false && @ship.sunk? == true
            return "X"
        else fired_upon? == false
            return "."
        end
    end
    
end