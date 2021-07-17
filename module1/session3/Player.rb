require_relative 'Character'
class Player < Character
    def initialize(name,hp,attack_damage)
        super
    end


    def die?
        if @hp <=0   
            puts "#{@name} dies as Player"
        true
        end
    end

    def probably(chance)
        return rand(1..100)<=chance
    end

    def not_take_damage(damage)
        @hp -=damage
    end
end