require 'sinatra'
require 'mysql2'
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
post '/registered' do
    user = params[:username]
    pass = params[:password]
    added = add_user(user, pass)
    if added == true
        userid = user_id(user)
        redirect '/loginlander?user_id=' + userid + '&added=' + added.to_s
    elsif added == false
        redirect '/registerfailed'
    end
end
post '/add' do
    user_id = params[:user_id]
    name = params[:name]
    phone = params[:phone]
    address = params[:address]
    relationship = params[:relationship]
    comment = params[:comment]
    work = add_contact(name, phone, address, relationship, comment, user_id)
    redirect '/edit?user_id=' + user_id
  end
  post '/delete' do
    user_id = params[:user_id]
    name = params[:name]
    phone = params[:phone]
    address = params[:address]
    relationship = params[:relationship]
    comment = params[:comment]
    remove_contact(name, phone, address, relationship, comment, user_id)
    redirect '/edit?user_id=' + user_id
  end
  post '/edit' do
    user_id = params[:user_id]
    name = params[:name]
    phone = params[:phone]
    address = params[:address]
    relationship = params[:relationship]
    comment = params[:comment]
    name2 = params[:name2]
    phone2 = params[:phone2]
    address2 = params[:address2]
    relationship2 = params[:relationship2]
    comment2 = params[:comment2]
    remove_contact(name, phone, address, relationship, comment, user_id)
    add_contact(name2, phone2, address2, relationship2, comment2, user_id)
    redirect '/edit?user_id=' + user_id
  end
  post '/back' do
    user_id = params[:user_id]
    redirect '/list?user_id=' + user_id
end
  get '/registerfailed' do
    erb :registerfailed
  end