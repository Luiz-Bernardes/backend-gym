class AddDeletedToPlans < ActiveRecord::Migration[7.1]
  def change
    add_column :plans, :deleted, :boolean, default: false , null: false 
  end
end
