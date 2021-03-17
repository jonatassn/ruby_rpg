class Creature
    attr_accessor :name, :hp, :atk, :defe, :int, :str, :main_stat_multiplier, :sprite

    def initialize name,hp, atk, defe, int, str, main_stat, sprite
        self.name = name
        self.hp = hp
        self.atk = atk
        self.defe = defe
        self.int = int
        self.str = str
        self.main_stat_multiplier = apply_main_stat_modifier main_stat
        self.sprite = sprite
    end

    def render moving=false
        #system "cls"
        gap = "   "
        self.sprite.each do |linha|
            if moving  
                linha = "     " + linha
            end
            puts linha
        end
    end

    def attack
        render moving=true
        max_attack = self.atk + self.main_stat_multiplier
    end

    def apply_main_stat_modifier main_stat
        if main_stat == :str
            self.str * 0.75
        elsif main_stat == :int
            self.int * 0.75
        end
    end
end