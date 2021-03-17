require_relative 'os_check'

def rng max_number
    rng = 1 + rand(max_number)
end

def render_dice max_number
    rng_l = 0
    clear = os == :linux ? "clear": "cls"
    for x in 1..10
        rng_l = rng(max_number)
        system clear.to_s
        if rng_l > 9
            puts "  ***********"
            puts " *       *  *"
            puts "*********   *"   
            puts "*   #{rng_l}  *   *"
            puts "*       *  *"
            puts "**********"
        else 
            puts "  ***********"
            puts " *       *  *"
            puts "*********   *"   
            puts "*   #{rng_l}   *   *"
            puts "*       *  *"
            puts "**********"
        end
        sleep(0.3)
    end
    rng_l
end