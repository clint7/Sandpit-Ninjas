require 'sinatra'
require 'json'
require 'sinatra/activerecord'

class MyApp < Sinatra::Base

  get '/' do
    send_file File.join('public', '/index.html')
  end

  get '/test_api' do
    content_type :json
    { :key1 => "dope", :key2 => 'value2' }.to_json
  end

  get '/get_locs' do
    content_type :json

    locs = Location.uniq.pluck(:name)
    age = Age.uniq.pluck(:name)

    {:locations => locs, :age => age}.to_json
  end

  # look at fixing this now
  # not_found do
  #   content_type :json
  #   halt 404, { error: 'URL not found' }.to_json
  # end

end #end