require_relative 'Player'

jin = Player.new("Jin Sakai",100,50)
puts jin
puts "\n"
khotun = Player.new("Khotun Khan", 500,50)
puts khotun
puts "\n"

loop do
    jin.attack(khotun)
    puts khotun
    puts "\n"
    break if khotun.die?

    if jin.probably(0.8)
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
