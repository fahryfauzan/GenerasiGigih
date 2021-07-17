require "sinatra"

get '/messages' do
  erb :messages, locals: {
    color: 'DodgerBlue',
    name: 'World'
  }
end

get '/messages/:name' do
  name = params['name']
  color = params['color'] ? params['color'] : 'DodgerBlue'
  "<h1 style =\"background-color:#{color};\">Hello #{name}</h1>"
end

get '/login' do
  erb:login
end
  

post '/login' do
  if params['username'] == 'admin' && params['password'] == 'admin'
    return 'Logged In!'
  else
    redirect '/login'
  end
end

get '/lists' do
  lists = ["Komputer", "Keyboard","Mouse","Speaker"]
  erb :lists, locals: {
    lists: lists
  }
end

post '/lists' do
  return "#{params['lists']}"
end
