require 'sinatra'

class OilTrader < Sinatra::Base

set :views, Proc.new { File.join(root, "./app/" "views") }

get '/' do
	'Hello World'
end

end