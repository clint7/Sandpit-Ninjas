class Offence < ActiveRecord::Base
	has_many :crimes
end