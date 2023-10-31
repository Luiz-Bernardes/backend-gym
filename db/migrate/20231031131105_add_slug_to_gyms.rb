class AddSlugToGyms < ActiveRecord::Migration[7.1]
  def change
    add_column :gyms, :slug, :string
  end
end
