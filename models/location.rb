class Location < ActiveRecord::Base
	has_many :crimes
end