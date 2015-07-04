   
class AddData < ActiveRecord::Migration
  	def change
  		Rake::Task['loaddata2014'].invoke
	end
end
