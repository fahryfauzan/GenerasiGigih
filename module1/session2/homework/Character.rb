class Character
    attr_reader :name
    def initialize(name,hp,attack_damage)
        @name = name
        @hp = hp
        @attack_damage = attack_damage
    end

    def to_s
        "#{@name} has hitpoin #{@hp} and attack damage #{@attack_damage}"
    end

    def attack(other_player)
        other_player.take_damage(@attack_damage)
        puts "#{@name} attacks #{other_player.name} with #{@attack_damage} damage"
    end

    def take_damage(damage)
        @hp -= damage
    end

    def heal(ally)
        @heal = 20
        ally.add_hp(@heal)
        puts "#{@name} heals #{ally.name}, restoring #{@heal} hitpoints"
    end

    def add_hp(heal)
        @hp += heal
    end

    def die?
        if @hp <=0   
            puts "#{@name} dies"
        true
        end
    end
end




