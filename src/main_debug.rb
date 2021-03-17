require_relative './data/races/Dwarf'
require_relative './data/races/Elf'
require_relative './data/races/Human'
require_relative './data/races/Orc'
require_relative './data/races/Race'
require_relative './data/role/Role'
require_relative './data/char/Character'
require_relative 'menu'
require_relative './data/other/dice'
require_relative './data/other/Creature'
require_relative './data/other/sprites'

class Character
    def trainning roles
        rate = Float(100)
        if self.roles.length < 1
            add_role roles
            true
        elsif self.roles.length < 2
            if render_dice(10) <= 6
                add_role roles
                true
            end
        elsif self.roles.length < 3
            if render_dice(10) <= 2
                add_role roles
                true
            end
        else
            false
        end
    end
end


human_race = Human.new "Human", 20, 8, 8, 10, 10
elf_race = Elf.new "Elf", 25, 5, 6, 20, 10
dwarf_race = Dwarf.new "Dwarf", 18, 9, 11, 7, 20
orc_race = Orc.new "Orc", 15, 12, 5, 2, 25

builder = Role.new
blacksmith = Role.new
healer = Role.new
warrior = Role.new

builder.name = 'Builder'
builder.skills = ['Build houses']
builder.stats_ratio = {str: 1, int: 1, hp: -2}

blacksmith.name = 'Blacksmith'
blacksmith.skills = ['Forge Weapons and Armors']
blacksmith.stats_ratio = {str: 2, atk: 1}

healer.name = 'Healer'
healer.skills = ['Heal other unities']
healer.stats_ratio = {defe: 3, atk: -1, int: 3}

warrior.name = 'Warrior'
warrior.skills = ['Attack', 'Defend']
warrior.stats_ratio = {defe: 2, atk: 3, str: 2}

character = Character.new 'Jorgen', 21, dwarf_race, [blacksmith]

puts builder.name
puts blacksmith.name
puts healer.name
puts warrior.name
puts "==========================="
puts builder.skills
puts blacksmith.skills
puts healer.skills
puts warrior.skills
puts "==========================="
puts builder.stats_ratio
puts blacksmith.stats_ratio
puts healer.stats_ratio
puts warrior.stats_ratio
puts "==========================="
puts character
puts "==========================="
character = Character.new 'Sven', 21, orc_race, [builder]

puts character
puts "==========================="
fire_devil = Creature.new "Fire Devil",10, 5, 8, 11, 6, :int, devil_sprite_1
fire_devil.render
puts fire_devil.attack
#render_dice 20