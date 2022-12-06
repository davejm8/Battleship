class Cell
    attr_reader :coordinate,
                :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = ship
        @cell_hit = false
    end

    def empty?
        @ship == nil
    end

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon
        if @ship.nil? == false && @ship.hit == false
            @cell_hit = true
        else
            @cell_hit = false
        end
    end

    def fired_upon?
        if @cell_hit = true
            @cell_hit = false
        end

    end

    
end