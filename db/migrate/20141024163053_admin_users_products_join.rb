class AdminUsersProductsJoin < ActiveRecord::Migration


  def change
    create_table :admin_users_products, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "line_id"
    end
    add_index :admin_users_products, ["admin_user_id", "line_id"]
  end
end