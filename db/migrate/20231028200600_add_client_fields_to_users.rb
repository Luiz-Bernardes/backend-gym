class AddClientFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :weight, :decimal
    add_column :users, :height, :decimal
    add_column :users, :birthdate, :string
    add_column :users, :begindate, :string
    add_column :users, :plan_id, :integer
  end
end
