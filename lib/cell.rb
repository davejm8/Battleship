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

    
end