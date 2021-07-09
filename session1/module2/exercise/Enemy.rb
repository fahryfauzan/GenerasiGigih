require_relative 'Character'
class Enemy < Character
    def die?
        if @hp <=0   
            puts "#{@name} dies as Enemy"
        true
        end
    end

    def deflected(other_player)
        attack_deflect = @attack_damage
        other_player.not_take_damage(attack_deflect = 0)
        puts "#{@name} attacks #{other_player.name} with #{@attack_damage} damage"
        puts "#{other_player.name} deflects the attack"
    end
end

class Archer < Enemy

end

class Spearman < Enemy

end

class Swordsman < Enemy

end
