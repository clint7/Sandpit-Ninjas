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

  get '/get_locs' do
    content_type :json

    locs = Location.uniq.pluck(:name)
    age = Age.uniq.pluck(:name)

    {:locations => locs, :age => age}.to_json
  end

  post '/post_user_info' do
    json = JSON.parse(request.body.read)
    
    location = Location.where(name: json['loc'])
    age = Age.where(name: json['age'])
    crimes = Crime.where(gender: json['gen'], location: location, age: age)

    result = []
    top_six = []

    offs = Offence.all

    offs.each do |off|
      top_six << {id: off.id ,offence: off.face_name, long_name: off.name, total: crimes.where(offence: off).count}
    end
    top_six = top_six.take(6).sort { |x,y| y[:total] <=> x[:total] };

    gen_off = top_six.sample

    puts gen_off
    gen_crime = Crime.where(offence_id: gen_off[:id])
    puts "past" 

    gender_pick = {offence: gen_off[:offence], male: gen_crime.where(gender: "Male").count, female: gen_crime.where(gender: "Female").count}

    result = {}

    {:crimes => top_six, :gender => gender_pick}.to_json
  end

  # look at fixing this now
  # not_found do
  #   content_type :json
  #   halt 404, { error: 'URL not found' }.to_json
  # end

end #end