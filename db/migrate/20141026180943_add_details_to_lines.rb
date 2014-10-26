class AddDetailsToLines < ActiveRecord::Migration
  def change
  	add_column "lines", "description", :string
  	add_column "lines", "gender", :string
  end
end
