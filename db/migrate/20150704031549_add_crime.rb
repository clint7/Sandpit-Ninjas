class AddCrime < ActiveRecord::Migration
	def change
    create_table :crimes do |t|
      t.integer :location_id
      t.integer :offence_id
      t.integer :age_id
      t.string :gender
      t.string :year
      t.timestamps null: false
    end
  end
end
