class AddMedicalFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :medical_name, :string
    add_column :users, :medical_address, :string
    add_column :users, :medical_email, :string
    add_column :users, :medical_telephone, :string
    add_column :users, :medical_type, :string
  end
end
