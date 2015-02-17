require 'sinatra'
require 'sinatra/base'

require './app/models/baron'

set :partial_template_engine, :erb

get '/' do
  erb :index
end

post '/new_baron' do
  baron = Baron.new(params[:name])
  redirect '/trader'
end

get '/trader' do
  erb :trader
end