require './models/category.rb'

class CategoryController
    def show_all_categories
        categories = Category.all
        renderer = ERB.new(File.read("./views/index_category.erb"))
        renderer.result(binding)
    end

    def show_add_categories
        renderer = ERB.new(File.read("./views/create_category.erb"))
        renderer.result(binding)
    end

    def add_categories(id,name)
        categories = Category.new(id,name)
        categories.save
    end

    def show_update_categories(id)
        category = Category.by_id(id)
        renderer = ERB.new(File.read("./views/update_category.erb"))
        renderer.result(binding)
    end

    def update_categories(id,name)
        Category.update(id,name)
    end

    def delete_categories(id)
        Category.delete(id)
    end

    def show_category_items(category_id)
        category = Category.get_category_items(category_id)
        renderer = ERB.new(File.read("./views/category_items.erb"))
        renderer.result(binding)
    end
end