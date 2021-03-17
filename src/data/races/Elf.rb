require_relative 'Race'
class Elf < Race
    def initialize name, hp, atk, defe, int, str
        super(name, hp, atk, defe, int, str)
    end
end