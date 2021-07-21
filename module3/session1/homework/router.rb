require 'sinatra'
require './db_connector'

get '/' do
    items = get_all_items
    erb :index, locals: {
        items: items
    }
end

get '/item/show/:id' do
    id = params['id']
    itemscat = get_item_categories(id)
    erb :show, locals: {
        itemscat: itemscat
    }
end

get '/items/new' do
    erb :create
end

post '/items/create' do
    name = params['name']
    price = params['price']
    create_new_item(name,price)
    redirect '/'
end

get '/item/edit/:id' do
    id = params['id']
    itemscat = get_item_categories(id)
    categories = get_all_categories
    erb :edit, locals: {
        itemscat: itemscat,
        categories: categories
    }
end


put '/item/update/:id' do
    id = params['id']
    update_item(id, name, price)
    redirect '/'
end

get '/item/formdelete/:id' do
    id = params['id']
    items = get_item(id)
    erb :formdelete, locals: {
        items: items
    }
end

delete '/item/delete/:id' do
    id = params['id']
    delete_item(id)
    redirect '/'
end