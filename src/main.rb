require_relative './data/races/Dwarf'
require_relative './data/races/Elf'
require_relative './data/races/Human'
require_relative './data/races/Orc'
require_relative './data/races/Race'
require_relative './data/role/Role'
require_relative './data/char/Character'
require_relative 'menu'
require_relative './data/other/getc'
require_relative './data/other/dice'
require_relative './data/other/Creature'
require_relative './data/other/sprites'
require 'faker'




races = {   human_race:Human.new("Human", 20, 8, 8, 10, 10),
            elf_race:Elf.new("Elf", 25, 5, 6, 20, 10),
            dwarf_race:Dwarf.new("Dwarf", 18, 9, 11, 7, 20),
            orc_race:Orc.new("Orc", 15, 12, 5, 2, 25)
        }

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

roles = {   builder:builder,
            blacksmith:blacksmith,
            healer:healer,
            warrior:warrior
        }

characters = []

opt = 1
while opt!=0
    
    system "cls"
    system "clear"
    main_menu_render opt
    c = read_char
    case c
    when "e"
        if opt == 1
            system "clear"
            puts "Type the character name (leave blank to random name): "
            name = gets.strip
            if name.empty?
                puts "This may take a while..."
                name = Faker::Games::Heroes.name
                puts "Your character name is #{name}"
            end
            puts "Type the character age: "
            age = gets.strip.to_i
            puts "Type the number of the character race"
            count = 1
            races.each do |key, r|
                puts "#{count} - #{r.name}"
                count += 1
            end
            race = Race
            race_opt = gets.strip.to_i
            count = 1
            races.each do |key, r|
                if count == race_opt
                    race = r
                    break
                end
                count += 1
            end

            puts "Type the number of the character role"
            count = 1
            roles.each do |key, r|
                puts "#{count} - #{r.name}"
                count += 1
            end
            role = Role
            role_opt = gets.strip.to_i
            count = 1
            roles.each do |key, r|
                if count == role_opt
                    role = r
                    break
                end
                count += 1
            end

            character = Character.new name, age, race, [role]
            system "clear"
            puts "Character created successfully: "
            puts character
            characters << character
            puts "Press RETURN to continue"
            gets

        elsif opt == 2
            system "clear"
            puts "Type the role name: "
            name = gets.strip
            puts "Type the role's skills"
            skills_opt = -1
            skills = []
            while skills_opt != 0 
                puts "Type the skill name or 0 to finish"
                skill_name = gets.strip
                if skill_name == '0'
                    skills_opt = 0
                else
                    skills << skill_name
                end
            end
            puts "Type the stats modifiers option"
            puts "1 - HP"
            puts "2 - ATK"
            puts "3 - DEF"
            puts "4 - INT"
            puts "5 - STR"
            puts "0 - Finish"
            modifiers_opt = -1
            modifiers = {}
            while modifiers_opt != 0 
                stat_modifier = 0
                stat_modifier = gets.strip.to_i
                case stat_modifier
                when 1
                    puts "Type the HP modifier value: "
                    value = gets.strip.to_i
                    modifiers[:hp] = value
                when 2
                    puts "Type the ATK modifier value: "
                    value = gets.strip.to_i
                    modifiers[:atk] = value
                when 3
                    puts "Type the DEF modifier value: "
                    value = gets.strip.to_i
                    modifiers[:defe] = value
                when 4
                    puts "Type the INT modifier value: "
                    value = gets.strip.to_i
                    modifiers[:int] = value
                when 5
                    puts "Type the STR modifier value: "
                    value = gets.strip.to_i
                    modifiers[:str] = value
                else
                    modifiers_opt = 0
                end
                system "clear"
                puts "1 - HP"
                puts "2 - ATK"
                puts "3 - DEF"
                puts "4 - INT"
                puts "5 - STR"
                puts "0 - Finish"
            end
            role = Role.new
            role.name = name
            role.skills = skills
            role.stats_ratio = modifiers
            roles[name.to_sym] = role
            system "clear"
            puts "Role created successfully: "
            puts role
            puts "Press RETURN to continue"
            gets
        elsif opt == 3
            puts "Type the number of the character who will try learn a new role"
            count = 1
            characters.each do |character|
                puts "#{count} - #{character.name}"
                count += 1
            end
            char_opt = gets.strip.to_i
            char = Character
            if char_opt > 0  and char_opt <= characters.size
                char = characters[char_opt-1]
            end
            puts "Type the number of the role to learn"
            count = 1
            roles.each do |key, r|
                puts "#{count} - #{r.name}"
                count += 1
            end
            role = Role
            role_opt = gets.strip.to_i
            count = 1
            roles.each do |key, r|
                if count == role_opt
                    role = r
                    break
                end
                count += 1
            end
            if char.learn_role role
                puts "New role learned successfully"
            else
                puts "The character failed to learn the new role *sad naruto song*"
            end
            puts "Press RETURN to continue"
            gets
        elsif opt == 4
            puts "Type the number of the role to search"
            count = 1
            roles.each do |key, r|
                puts "#{count} - #{r.name}"
                count += 1
            end
            role = Role
            role_opt = gets.strip.to_i
            count = 1
            roles.each do |key, r|
                if count == role_opt
                    role = r
                    break
                end
                count += 1
            end
            characters.each do |c|
                c.roles.each do |r|
                    if r.name == role.name 
                        puts c
                        break
                    end 
                end
            end
            puts "Press RETURN to continue"
            gets
        elsif opt == 5
            puts "Type the number of the character race"
            count = 1
            races.each do |key, r|
                puts "#{count} - #{r.name}"
                count += 1
            end
            race = Race
            race_opt = gets.strip.to_i
            count = 1
            races.each do |key, r|
                if count == race_opt
                    race = r
                    break
                end
                count += 1
            end
            characters.each do |c|
                if c.race.name == race.name 
                    puts c
                    break
                end 
            end
            puts "Press RETURN to continue"
            gets
        elsif opt == 6
            system "clear"
            opt = 0
        end
    when "w"#"\e[A"
        if opt > 1
            opt -= 1
        else
            opt = 6
        end
    when "s"#"\e[B"
        if opt < 6
            opt += 1
        else
            opt = 1
        end
    end
end


#27 91 65
#27 91 66