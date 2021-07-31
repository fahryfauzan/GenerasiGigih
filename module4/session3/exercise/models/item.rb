#require './db/mysql_connector.rb'

class Item
    attr_accessor :name, :price, :id, :category

    def initialize(id, name, price)
        @id = id
        @name = name
        @price = price
        @Category = []
    end

    def to_s
        "#{name}"
    end

    def valid?
        return false if @name.nil?
        return false if @price.nil?
        true
    end
    
    def save
        return false unless valid?  

        client = create_db_client
        client.query("INSERT INTO items(name,price) VALUES('#{name}','#{price}')")

        true
    end

    def self.get_all_items
        client = create_db_client
        client.query("select * from items")
    end

    def self.get_items_id(id)
        client = create_db_client
        client.query("select id,name,price from items where id = #{id}")
    end

    def self.rawData(rawdata)
        items = Array.new
        rawdata.each do |data|
            item = Item.new(data['id'],data['name'],data['price'])
            items.push(item)
        end
        items
    end

    def self.all 
        rawdata = get_all_items
        rawData(rawdata)
    end

    def self.by_id(id) 
        rawdata = get_items_id(id)
        rawData(rawdata)
    end

    def self.update(id,name,price)
        return false unless valid? 

        client = create_db_client
        client.query("Update items set name = '#{name}', price = '#{price}' where id = '#{id}'")

        true
    end

    def self.delete(id)
        return false unless valid? 

        client = create_db_client
        client.query("delete from items where id= #{id}")

        true
    end
end