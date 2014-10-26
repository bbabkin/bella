class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer "line_id"
      t.string :name
      t.integer :volume
      t.integer :price
      t.text :description
      t.string :permalink
      t.integer :position
      t.boolean :visible, :default => false
      t.timestamps
    end
    add_index("products", "line_id")
    add_index("products", "permalink")
  end
end
