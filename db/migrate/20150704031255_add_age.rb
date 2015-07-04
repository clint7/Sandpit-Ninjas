class AddAge < ActiveRecord::Migration
	def change
    create_table :ages do |t|
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end
