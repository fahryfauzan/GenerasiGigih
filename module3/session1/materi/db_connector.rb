require 'mysql2'
require './item'
require './category'

def create_db_client
    client = Mysql2::Client.new(
        :host     => '127.0.0.1', 
        :username => 'root',      
        :password => '',    
        :database => 'restoran',          
        )
    client
end

def get_all_items
    client = create_db_client
    rawData = client.query("select * from items")

    items = Array.new

    rawData.each do |data|
        item = Item.new(data["id"], data["name"], data["price"])
        items.push(item)
    end
    items
end

def get_all_categories
    client = create_db_client
    categories = client.query("select * from categories")
end

def get_item_categories
    client = create_db_client
    rawData = client.query("select item_categories.item_id, items.name as 'Item', categories.id as 'category_id',categories.name as 'category_name'
        from item_categories
        join items on items.id=item_categories.item_id
        join categories on categories.id=item_categories.category_id")
    items = Array.new

    rawData.each do |data|
        category = Category.new(data["category_id"], data["category_name"])
        item = Item.new(data["id"], data["name"], data["price"], category)
        items.push(item)
    end
    items
end

def create_new_item(name, price)
    client = create_db_client
    client.query("insert into items(name,price) values('#{name}', '#{price}')")
end

puts("---Menu------")
items = get_all_items()
puts(items.each)

puts("---Categories------")
categories = get_all_categories()
puts(categories.each)

puts("---Item with Categories------")
item_categories = get_item_categories()
puts(item_categories.each)