require './main'
require "sinatra/activerecord/rake" 
require 'csv'
require './models/crime'
require './models/location'
require './models/offence'
require './models/age'

task :loaddata2014 do
  CSV.foreach('dataset.csv', :headers => true) do |row|
    data = row.to_hash

    if data["Year"].to_i > 2013

      ActiveRecord::Base.transaction do
        loc = Location.find_or_create_by(name: data["Location"])
        off = Offence.find_or_create_by(name: data["Offence"])
        age = Age.find_or_create_by(name: data["Age"])

    
        for counter in 0..data["Value"].to_i
          Crime.create(location: loc, offence: off, age: age, gender: data["Gender"], year: data["Year"])
        end
      end

    end

    puts "row #{$.}"  
  end 
end

task :loaddata2013 do
  CSV.foreach('dataset.csv', :headers => true) do |row|
    data = row.to_hash

    if data["Year"].to_i > 2012 && data["Year"] < 2014

      ActiveRecord::Base.transaction do
        loc = Location.find_or_create_by(name: data["Location"])
        off = Offence.find_or_create_by(name: data["Offence"])
        age = Age.find_or_create_by(name: data["Age"])

    
        for counter in 0..data["Value"].to_i
          Crime.create(location: loc, offence: off, age: age, gender: data["Gender"], year: data["Year"])
        end
      end
    end
    puts "row #{$.}"  
  end 
end