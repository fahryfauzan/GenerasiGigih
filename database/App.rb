require 'mysql2'

client = Mysql2::Client.new(
	:host     => '127.0.0.1', 
	:username => 'root',      
	:password => '',    
	:database => 'ruby',      
	:encoding => 'utf8'       
	)
results = client.query("select * from student")
results.each do |row|
  puts row
end