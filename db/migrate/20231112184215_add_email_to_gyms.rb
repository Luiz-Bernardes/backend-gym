class AddEmailToGyms < ActiveRecord::Migration[7.1]
  def change
    add_column :gyms, :email, :string
  end
end
