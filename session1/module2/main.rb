require_relative 'Character'

jin = Player.new("Jin Sakai",100,50)
puts jin
puts "\n"
khotun = Enemy.new("Khotun Khan", 500,50)
puts khotun
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
