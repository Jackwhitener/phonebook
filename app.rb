require 'sinatra'
require 'csv'
require_relative 'sql.rb'
get '/' do
    erb :home
end
post '/loginlander' do
    user = params[:username]
    pass = params[:password]
    if check_if_taken(user) && passcheck(pass, get_pass(user))
    user_id = user_id(user)
    redirect '/loginlander?user_id=' + user_id
    else
        user_id = 'wrong'
        redirect '/loginlander?user_id=' + user_id
    end
end
get '/loginlander' do
    user_id = params[:user_id]
    erb :loginlander, locals: {user_id: user_id}
end
post '/list' do
    user_id = params[:user_id]
    redirect '/list?user_id=' + user_id
end
get '/list' do
    user_id = params[:user_id]
erb :list, locals: {user_id: user_id}
end
post '/viewcon' do
    user_id = params[:user_id]
    redirect '/view?user_id='
end
get '/view' do
    user_id = params[:user_id]
    erb :view, locals: {user_id: user_id}
end
post '/editcon' do
    user_id = params[:user_id]
    redirect '/edit?user_id=' + user_id
end
get '/edit' do
    user_id = params[:user_id]
    erb :edit, locals: {user_id: user_id}
end
post '/register' do
    redirect '/register?'
end
get '/register' do
    erb :register
end
post '/registered' do
    user = params[:username]
    pass = params[:password]
    add_user(user, pass)
    redirect '/'
end