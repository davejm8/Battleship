class Board
    attr_reader :cells, 
                :coordinates
    def initialize
        @cells = {
            "A1" => Cell.new("A1"),
            "A2" => Cell.new("A2"),
            "A3" => Cell.new("A3"),
            "A4" => Cell.new("A4"),
            "B1" => Cell.new("B1"),
            "B2" => Cell.new("B2"),
            "B3" => Cell.new("B3"),
            "B4" => Cell.new("B4"),
            "C1" => Cell.new("C1"),
            "C2" => Cell.new("C2"),
            "C3" => Cell.new("C3"),
            "C4" => Cell.new("C4"),
            "D1" => Cell.new("D1"),
            "D2" => Cell.new("D2"),
            "D3" => Cell.new("D3"),
            "D4" => Cell.new("D4")
           }
        @valid_coordinate = @cells.keys
    end

    def valid_coordinate?(coordinate)
        @cells.include?(coordinate) && !@cells[coordinate].fired_upon?
    end

    def valid_placement?(ship_type, coordinates)
        valid_length?(ship_type, coordinates) && valid_consecutive(coordinates,ship_type) && occupied(coordinates) 
    end

    def valid_length?(ship_type, coordinates)
        ship_type.length == coordinates.length
    end

    def occupied(coordinates)
        coordinates.all? do |coord|
            cells[coord].empty?
        end
    end

    def valid_consecutive(coordinates, ship_type)
        if ship_type.name == "Submarine"
            coordinates.each_cons(2).all? do |first, second|
                if first[0] == second[0]
                    first[1].ord + 1 == second[1].ord
                elsif first[0].ord + 1 == second[0].ord
                    first[1] == second[1]
                else 
                    false
                end
            end
        elsif ship_type.name == "Cruiser"
            coordinates.each_cons(3).all? do |first, second, third|
                if first[0] == second[0] && second[0] == third[0]
                    first[1].ord + 1 == second[1].ord&& second[1].ord + 1 == third[1].ord
                elsif first[0].ord + 1 == second[0].ord && second[0].ord + 1 == third[0].ord
                    first[1] == second[1] && second[1] == third[1]
                else 
                    false
                end
            end
        else
            false
        end
    end

    def place(ship_type, coordinates)
        coordinates.map do |coordinate|
            @cells[coordinate].place_ship(ship_type)  
        end
    end

    def render(reveal_ship = false)
       board_render =  "  1 2 3 4 \n" +
        "A #{cells["A1"].render(reveal_ship)} #{cells["A2"].render(reveal_ship)} #{cells["A3"].render(reveal_ship)} #{cells["A4"].render(reveal_ship)} \n" +
        "B #{cells["B1"].render(reveal_ship)} #{cells["B2"].render(reveal_ship)} #{cells["B3"].render(reveal_ship)} #{cells["B4"].render(reveal_ship)} \n" +
        "C #{cells["C1"].render(reveal_ship)} #{cells["C2"].render(reveal_ship)} #{cells["C3"].render(reveal_ship)} #{cells["C4"].render(reveal_ship)} \n" +
        "D #{cells["D1"].render(reveal_ship)} #{cells["D2"].render(reveal_ship)} #{cells["D3"].render(reveal_ship)} #{cells["D4"].render(reveal_ship)} \n" 
    end
end