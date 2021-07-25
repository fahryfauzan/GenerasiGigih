require './db/mysql_connector.rb'

class Item
    attr_accessor :name, :price, :id, :category

    def initialize(id,name,price,category=nil)
        @id = id
        @name = name
        @price = price
        @category = category
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


end