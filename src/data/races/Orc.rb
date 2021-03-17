require_relative 'Race'
class Orc < Race
    def initialize name, hp, atk, defe, int, str
        super(name, hp, atk, defe, int, str)
    end
end