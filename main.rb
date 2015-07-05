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

    samples = top_six.sample(2)

    gen_off = samples.first

    puts gen_off
    gen_crime = Crime.where(offence_id: gen_off[:id])
    puts "past" 

    gender_pick = {offence: gen_off[:offence], offence_long_name: gen_off[:long_name], male: gen_crime.where(gender: "Male").count, female: gen_crime.where(gender: "Female").count}

    time_comp = samples.last

    puts time_comp

    time_crime = Crime.where(offence_id: time_comp[:id])

    temp = []

    Crime.uniq.pluck(:year).each do |year|
      temp << {year: year, total: time_crime.where(year: year).count}
    end

    temp = temp.sort { |x,y| x[:year] <=> y[:year] };

    time_crime_result = {offence: time_comp[:offence], offence_long_name: time_comp[:long_name], data: temp}

    result = {}

    {:crimes => top_six, :gender => gender_pick, time_crime: time_crime_result}.to_json
  end

  # look at fixing this now
  # not_found do
  #   content_type :json
  #   halt 404, { error: 'URL not found' }.to_json
  # end

end #end