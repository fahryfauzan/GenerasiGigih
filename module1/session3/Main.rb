require_relative 'Player'
require_relative 'Enemy'
require_relative 'Ally'

jin = Player.new("Jin Sakai",100,50)
yuna = Ally.new("Yuna", 90, 45)
sensei = Ally.new("Sensei Ishikawa", 80,60)
archer = Archer.new("Mongol Archer", 80,40)
spear = Spearman.new("Mongol Spearman", 120,60)
sword = Swordsman.new("Mongol Swordman", 100, 50)
allies = [yuna,sensei]
enemies = [archer, spear,sword]

i = 1

until (jin.die? || enemies.empty?) do
    puts "============ Turn #{i} ================"
    puts "\n"
    puts jin
    allies.each do |alie|
        puts alie
    end
    puts "\n"
    enemies.each do |enemie|
        puts enemie
    end
    puts "\n"

    puts 'As jin Sakai, what do you want to do this turn?'
    puts '1) Attack an enemy'
    puts '2) Heal an ally'
    choose = gets.chomp

    if choose == '1'
        puts 'Which enemy you want to attack?'
        puts '1) Mongol Archer'
        puts '2) Mongol Spearman'
        puts '3) Mongol Swordsman'
        att = gets.chomp

        if att == '1'
            if archer.die? == false
                jin.attack(archer)
            else
                break if archer.die?
            end

            allies.each do |alie|
                alie.attack(enemies[rand(enemies.size)])
                break if alie.die?
            end

            enemies.each do |enemie|
                enemies.delete(enemie) if enemie.die?
            end
            puts "\n"

            enemies.each do |enemie|
                enemie.attack(allies[rand(allies.size)])
                break if enemie.die?
                if jin.probably(80)
                    enemie.deflected(jin)
                end
            end
            allies.each do |alie|
                allies.delete(alie) if alie.die?
            end
            break if jin.die?
            puts "\n"

        elsif att == '2'
            if spear.die? == false
                jin.attack(spear)
            else
                break if spear.die?
            end
            
            allies.each do |alie|
                alie.attack(enemies[rand(enemies.size)])
                break if alie.die?
            end

            enemies.each do |enemie|
                enemies.delete(enemie) if enemie.die?
            end
            puts "\n"

            enemies.each do |enemie|
                enemie.attack(allies[rand(allies.size)])
                break if enemie.die?
                if jin.probably(80)
                    enemie.deflected(jin)
                end
            end
            allies.each do |alie|
                allies.delete(alie) if alie.die?
            end
            break if jin.die?
            puts "\n"
        elsif att == '3'
            if sword.die? == false
                jin.attack(sword)
            else
                break if sword.die?
            end

            allies.each do |alie|
                alie.attack(enemies[rand(enemies.size)])
                break if alie.die?
            end

            enemies.each do |enemie|
                enemies.delete(enemie) if enemie.die?
            end
            puts "\n"

            enemies.each do |enemie|
                enemie.attack(allies[rand(allies.size)])
                break if enemie.die?
                if jin.probably(80)
                    enemie.deflected(jin)
                end
            end
            allies.each do |alie|
                allies.delete(alie) if alie.die?
            end
            break if jin.die?
            puts "\n"

        end
        
    elsif choose == '2'
        puts 'Which ally you want to heal?'
        puts '1) Yuna'
        puts '2) Sensei Ishihara'
        hil = gets.chomp

        if hil == '1'
            jin.heal(yuna)
            puts yuna
            puts "\n"
            allies.each do |alie|
                alie.attack(enemies[rand(enemies.size)])
                break if alie.die?
            end

            enemies.each do |enemie|
                enemies.delete(enemie) if enemie.die?
            end
            puts "\n"

            enemies.each do |enemie|
                enemie.attack(allies[rand(allies.size)])
                break if enemie.die?
                if jin.probably(80)
                    enemie.deflected(jin)
                end
            end
            allies.each do |alie|
                allies.delete(alie) if alie.die?
            end
            break if jin.die?
            puts "\n"
        elsif hil == '2'
            jin.heal(sensei)
            puts sensei
            puts "\n"
            allies.each do |alie|
                alie.attack(enemies[rand(enemies.size)])
                break if alie.die?
            end

            enemies.each do |enemie|
                enemies.delete(enemie) if enemie.die?
            end
            puts "\n"

            enemies.each do |enemie|
                enemie.attack(allies[rand(allies.size)])
                break if enemie.die?
                if jin.probably(80)
                    enemie.deflected(jin)
                end
            end
            allies.each do |alie|
                allies.delete(alie) if alie.die?
            end
            break if jin.die?
            puts "\n"
        end
    end
    i += 1
end