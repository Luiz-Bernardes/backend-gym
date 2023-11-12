class AddDefaultToEmailInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :email, :string, default: '-'
  end
end
