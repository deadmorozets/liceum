class AddIndexToUsers < ActiveRecord::Migration
  def change
  	add_index :users, [:last_name, :first_name], name: 'users_by_full_name'
  end
end
