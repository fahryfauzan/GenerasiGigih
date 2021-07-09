require_relative 'Character'
class Enemy < Character
    def initialize(name,hp,attack_damage)
        super
        @flee_percentage = 0.5
        @fled = false
    end

    def take_damage(damage)
        @hp -= damage
    end

    def deflected(other_player)
        attack_deflect = @attack_damage
        other_player.take_damage(attack_deflect = 0)
        puts "#{@name} attacks #{other_player.name} with #{@attack_damage} damage"
        puts "#{other_player.name} deflects the attack"
    end

    def flee
        @fled = true
        puts "#{@name} has fled the battlefield with #{@hp} hitpoint left"
    end

    def flee?
        @fled
    end

end

class Archer < Enemy
    def attack(other_player)
        puts "#{@name} shoots an arrow at #{other_player.name} with #{@attack_damage} damage"
        other_player.take_damage(@attack_damage)
    end
end

class Spearman < Enemy
    def attack(other_player)
        puts "#{@name} thrust #{other_player.name} with #{@attack_damage} damage"
        other_player.take_damage(@attack_damage)
    end
end

class Swordsman < Enemy
    def attack(other_player)
        puts "#{@name} slashes #{other_player.name} with #{@attack_damage} damage"
        other_player.take_damage(@attack_damage)
    end
end
