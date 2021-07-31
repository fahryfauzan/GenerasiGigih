require './models/item.rb'

class ItemController
    def show_all_item
        categories = Item.all
        renderer = ERB.new(File.read("./views/index.erb"))
        renderer.result(binding)
    end

    def show_add_item
        renderer = ERB.new(File.read("./views/create.erb"))
        renderer.result(binding)
    end

    def add_item(id,name)
        items = Item.new(id,name,price)
        items.save
    end

    def show_update_items(id)
        item = Item.by_id(id)
        renderer = ERB.new(File.read("./views/edit.erb"))
        renderer.result(binding)
    end

    def update_items(id,name,price)
        Item.update(id,name,price)
    end

    def delete_categories(id)
        Item.delete(id)
    end
end