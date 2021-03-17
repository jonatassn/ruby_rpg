require_relative 'Race'
class Human < Race
    def initialize name, hp, atk, defe, int, str
       super(name, hp, atk, defe, int, str)
    end
end

#@hp = hp
#@atk = atk
#@defe = defe
#@int = int
#@str = str