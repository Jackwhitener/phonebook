require 'sinatra'
require 'csv'
get '/' do
	erb :home
end

post '/list' do
    redirect '/list?'
end
get '/list' do
    erb :list
end
post '/addperson' do
    redirect '/list?'
end
get '/addperson' do
    erb :addperson
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