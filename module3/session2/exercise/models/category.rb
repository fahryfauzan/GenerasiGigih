require './db/mysql_connector.rb'

class Category
    attr_accessor :id, :name, :items

    def initialize(id,name)
        #raise ArgumentError, 'Params not valid' unless category_created?(cat)
        @id = id
        @name = name
        @items = []
    end

    def to_s
        @name.to_s
    end

    
    def save  
        client = create_db_client
        client.query("INSERT INTO categories(name) VALUES('#{name}')")
    end

    def self.get_all_categories
        client = create_db_client
        client.query("select * from categories")
    end

    def self.get_categories_id(id)
        client = create_db_client
        client.query("select id,name from categories where id = #{id}")
    end

    def add_item(data_item = {})
        item = Item.new(id: data_item[:id], name: data_item[:name], price: data_item[:price])
        @items << item
    end
    def self.get_category_items(category_id)
        client = create_db_client
        rawCat = client.query("select id,name from categories where id = #{category_id}")
        categories = rawData(rawCat)
        categories.each do |category|
            rawCatItems = client.query("select item_categories.item_id, items.name as 'item', items.price, category_id
                from item_categories
                left join items on items.id=item_categories.item_id
                where category_id= #{category.id}")

            rawCatItems.each do |catitem|
                category.add_item(id: catitem[:id], name: catitem[:name], price: catitem[:price])
            end
        end
        categories[0]
    end
    def self.rawData(rawdata)
        categories = Array.new
        rawdata.each do |data|
            category = Category.new(data['id'],data['name'])
            categories.push(category)
        end
        categories
    end

    def self.all 
        rawdata = get_all_categories
        rawData(rawdata)
    end

    def self.by_id(id) 
        rawdata = get_categories_id(id)
        rawData(rawdata)
    end

    def self.update(id,name)
        client = create_db_client
        client.query("Update categories set name = '#{name}' where id = '#{id}'")
    end

    def self.delete(id)
        client = create_db_client
        client.query("delete from categories where id= #{id}")
    end
end