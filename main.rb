require 'sinatra'
require 'json'
require 'sinatra/activerecord'

class MyApp < Sinatra::Base

	get '/' do
	 send_file File.join('public', '/index.html')
	end

	get '/test.css' do
	 send_file File.join(settings.public_folder, '/webapp/css/test.css')
	end

	get '/test_api' do
	 content_type :json
	 db_time = database.connection.execute('SELECT CURRENT_TIMESTAMP').first['now']
	 { :key1 => db_time, :key2 => 'value2' }.to_json
	end

	# not_found do
	#   content_type :json
	#   halt 404, { error: 'URL not found' }.to_json
	# end

end #end