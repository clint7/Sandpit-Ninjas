class AddData2012 < ActiveRecord::Migration
  def change
  	Rake::Task['loaddata2012'].invoke
  end
end
