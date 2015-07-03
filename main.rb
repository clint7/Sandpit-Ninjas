require 'sinatra'
require 'json'

class MyApp < Sinatra::Base
	get '/' do
	 content_type :json
	 { :key1 => 'value1', :key2 => 'value2' }.to_json
	end
end #end