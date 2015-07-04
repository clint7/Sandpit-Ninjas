class Crime < ActiveRecord::Migration
  def up
    change_table :crime do |t|
      t.change :price, :string
    end
  end
 
  def down
    change_table :crime do |t|
      t.change :price, :integer
    end
  end
end
