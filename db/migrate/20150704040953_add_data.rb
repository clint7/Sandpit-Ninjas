   
class AddData < ActiveRecord::Migration
  	def change
  		Rake::Task['loaddata'].invoke
	end
end
