require 'sinatra'
require 'csv'
get '/' do
    erb :home
end
post '/loginlander' do
    user = params[:username]
    pass = params[:password]
    redirect '/loginlander?user=' + user.to_s + '&pass=' + pass.to_s

end
get '/loginlander' do
    user = params[:user]
    pass = params[:pass]
    erb :loginlander, locals: {user: user, pass: pass}
end
post '/list' do
    redirect '/list?'
end
get '/list' do
erb :list
end
post '/register' do
    redirect '/register?'
end
get '/register' do
    erb :register
end
post '/registered' do
    redirect '/list?'
end
post '/viewcon' do
    redirect '/viewcon?'
end
get '/viewcon' do
    erb :view
end
post '/editcon' do
    redirect '/edit?'
end
get '/editcon' do
    erb :edit
end