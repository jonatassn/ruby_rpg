class Character
    attr_accessor :name, :age, :hp, :atk, :defe, :int, :str, :race, :roles

    def initialize name, age, race, roles
        self.name = name
        self.age = age
        self.hp = race.hp
        self.atk = race.atk
        self.defe = race.defe
        self.int = race.int
        self.str = race.str
        self.race = race
        self.roles = roles
        self.modify_stats
    end

    def modify_stats roles=self.roles
        puts roles.inspect
        self.roles.each do |role|
            role.stats_ratio.each do |key, value|
                if key == :hp
                    self.hp += value
                elsif key == :atk
                    self.atk += value
                elsif key == :defe
                    self.defe += value
                elsif key == :int
                    self.int += value
                elsif key == :str
                    self.str += value
                end
            end
        end
    end
    
    def add_role role
        self.roles << role
        modify_stats [role]
    end

    def learn_role roles
        if self.roles.length < 1
            add_role roles
            true
        elsif self.roles.length < 2
            if render_dice(10) >= 6
                add_role roles
                true
            end
        elsif self.roles.length < 3
            if render_dice(10) >=8
                add_role roles
                true
            end
        else
            false
        end
    end


    def to_s
        if self.roles.length < 2 
            "I am: #{self.name}, #{age} years old, 
        my stats are: \n\t#{self.hp} HP\n\t#{self.atk} ATK\n\t#{self.defe} DEF\n\t#{self.int} INT\n\t#{self.str} STR
        \nMy role is: #{self.roles[0]} "
        elsif self.roles.length < 3
            "I am: #{self.name}, #{age} years old, 
        my stats are: \n\t#{self.hp} HP\n\t#{self.atk} ATK\n\t#{self.defe} DEF\n\t#{self.int} INT\n\t#{self.str} STR
        \nMy roles are: #{self.roles[0]} and #{self.roles[1]} "
        else
            "I am: #{self.name}, #{age} years old, 
        my stats are: \n\t#{self.hp} HP\n\t#{self.atk} ATK\n\t#{self.defe} DEF\n\t#{self.int} INT\n\t#{self.str} STR
        \nMy roles are: #{self.roles[0]} and #{self.roles[1]} and #{self.roles[2]} "
        end
    end
end