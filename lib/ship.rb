class Ship
    attr_reader :name,
                :healthpoints
    def initialize(name, healthpoints)
        @name = name
        @healthpoints = 0
    end            

end