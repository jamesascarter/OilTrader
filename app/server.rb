require 'sinatra'
require 'sinatra/base'

set :partial_template_engine, :erb

get '/' do
  'hello word'
end

post '/new_baron' do
  baron = Baron.new(params[:name])
end