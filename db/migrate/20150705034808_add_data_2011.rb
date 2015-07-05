class AddData2011 < ActiveRecord::Migration
  def change
  	Rake::Task['loaddata2011'].invoke
  end
end
