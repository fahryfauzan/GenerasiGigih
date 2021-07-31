require 'sinatra'
require './controllers/category_controller.rb'

#------------- Route Category ------------------
get '/' do
    catcontrollers = ItemController.new
    catcontrollers.show_all_item
end

get '/item/new' do
    catcontrollers = ItemController.new
    catcontrollers.show_add_item
end

post '/item/add' do
    id = params['id']
    name = params['name']
    price = params['price']
    itemcontrollers = ItemController.new
    itemcontrollers.add_item(id,name,price)
    redirect '/'
end

get '/item/edit/:id' do
    catcontrollers = ItemController.new
    id = params['id']
    catcontrollers.show_update_items(id)
end

put '/item/update/:id' do
    catcontrollers = ItemController.new
    id = params['id']
    name = params['name']
    catcontrollers.update_categories(id,name)
    redirect '/'
end

get '/item/delete/:id' do
    id = params['id']
    catcontrollers = CategoryController.new
    catcontrollers.delete_categories(id)
    redirect '/category'
end
#---------Category Route-------------------
get '/category' do
    catcontrollers = CategoryController.new
    catcontrollers.show_all_categories
end

get '/category/new' do
    catcontrollers = CategoryController.new
    catcontrollers.show_add_categories
end

get '/category/edit/:id' do
    catcontrollers = CategoryController.new
    id = params['id']
    catcontrollers.show_update_categories(id)
end

put '/category/update/:id' do
    catcontrollers = CategoryController.new
    id = params['id']
    name = params['name']
    catcontrollers.update_categories(id,name)
    redirect '/category'
end

get '/category/show/:id' do
    catcontrollers = CategoryController.new
    category_id = params['id']
    name = params['name']
    price = params['price']
    catcontrollers.show_category_items(category_id)
end

post '/category/add' do
    id = params['id']
    name = params['name']
    catcontrollers = CategoryController.new
    catcontrollers.add_categories(id,name)
    redirect '/category'
end

get '/category/delete/:id' do
    id = params['id']
    catcontrollers = CategoryController.new
    catcontrollers.delete_categories(id)
    redirect '/category'
end

