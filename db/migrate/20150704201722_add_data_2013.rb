class AddData2013 < ActiveRecord::Migration
  def change
  	Rake::Task['loaddata2013'].invoke
  end
end
