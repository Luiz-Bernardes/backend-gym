class AddDeletedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :deleted, :boolean, default: false , null: false 
  end
end
