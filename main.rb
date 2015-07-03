require 'sinatra'
require 'json'

class MyApp < Sinatra::Base

	get '/' do
	 send_file File.join('public', '/index.html')
	end

	get '/test.css' do
	 send_file File.join(settings.public_folder, '/webapp/css/test.css')
	end

	get '/test_api' do
	 content_type :json
	 { :key1 => 'value1', :key2 => 'value2' }.to_json
	end

	# not_found do
	#   content_type :json
	#   halt 404, { error: 'URL not found' }.to_json
	# end

end #end