class AddUserIdToLojas < ActiveRecord::Migration
  def change
    add_column :lojas, :user_id, :integer
    add_index :lojas, :user_id
  end
end
