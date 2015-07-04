class Crime < ActiveRecord::Base
	belongs_to :offence
	belongs_to :age
	belongs_to :location
end