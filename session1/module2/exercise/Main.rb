require_relative 'Player'
require_relative 'Enemy'
jin = Player.new("Jin Sakai",100,50)
puts jin
puts "\n"
archer = Enemy.new("Mongol Archer", 80,40)
puts archer
puts "\n"

loop do
    jin.attack(khotun)
    puts khotun
    puts "\n"
    break if khotun.die?

    if jin.probably(80)
        khotun.deflected(jin)
        puts jin
        puts "\n"
        break if jin.die?
    else
        khotun.attack(jin)
        puts jin
        puts "\n"
        break if jin.die?
    end
end
