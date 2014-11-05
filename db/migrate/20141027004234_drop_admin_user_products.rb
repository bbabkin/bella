class DropAdminUserProducts < ActiveRecord::Migration
  def up
  	drop_table :admin_users_products
  end

	def down
		create_table :admin_users_products, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "line_id"
    end
    add_index :admin_users_products, ["admin_user_id", "line_id"]
  end

end
