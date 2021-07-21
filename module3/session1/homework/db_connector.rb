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

def get_item(id)
    client = create_db_client
    rawData = client.query("select * from items where items.id='#{id}'")

    items = Array.new

    rawData.each do |data|
        item = Item.new(data["id"], data["name"], data["price"])
        items.push(item)
    end
    items
end

def get_all_categories
    client = create_db_client
    rawDataCat = client.query("select * from categories")

    categories = Array.new

    rawDataCat.each do |data|
        category = Category.new(data["id"], data["name"])
        categories.push(category)
    end
    categories
end

def get_item_categories(id)
    client = create_db_client
    rawData = client.query("select item_categories.item_id, items.name as 'item', items.price, categories.id as 'category_id',categories.name as 'category_name'
        from item_categories
        left join items on items.id=item_categories.item_id
        left join categories on categories.id=item_categories.category_id
        where items.id='#{id}'")
    itemscat = Array.new

    rawData.each do |data|
        category = Category.new(data["category_id"], data["category_name"])
        item = Item.new(data["id"], data["item"], data["price"], category)
        itemscat.push(item)
    end
    itemscat
end

def create_new_item(name, price)
    client = create_db_client
    client.query("insert into items(name,price) values('#{name}', '#{price}')")
end

def update_item(id, name, price)
    client = create_db_client
    client.query("Update table items set name = '#{name}', price = '#{price}' where id = '#{id}'")
end

def delete_item(id)
    client = create_db_client
    client.query("delete from items where id= '#{id}'")
end