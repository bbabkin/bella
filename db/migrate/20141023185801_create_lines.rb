class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :name
      t.integer :position
			t.boolean :visible, :default => false
			t.string :permalink
      t.timestamps
    end
  end
end
