class AddIndexesForUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email
    add_index :users, :api_key
  end
end
