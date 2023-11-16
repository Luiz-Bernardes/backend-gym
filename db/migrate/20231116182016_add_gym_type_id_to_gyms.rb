class AddGymTypeIdToGyms < ActiveRecord::Migration[7.1]
  def change
    add_column :gyms, :gym_type_id, :integer
  end
end
