class AddColorToLines < ActiveRecord::Migration
  def change
  	add_column :lines, :color, :string
  end
end
