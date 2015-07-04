class AddOffence < ActiveRecord::Migration
	def change
    create_table :offences do |t|
      t.string :name
      t.string :face_name
      t.text :description
      t.timestamps null: false
    end
  end
end
