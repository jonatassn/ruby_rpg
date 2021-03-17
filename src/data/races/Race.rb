class Race
    attr_accessor :name, :hp, :atk, :defe, :int, :str
    def initialize name, hp, atk, defe, int, str
        @name = name
        @hp = hp
        @atk = atk
        @defe = defe
        @int = int
        @str = str
    end
end