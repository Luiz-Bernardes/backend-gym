class CreateAppConfigs < ActiveRecord::Migration[7.1]
  def change
    create_table :app_configs do |t|
      t.boolean :medical_attributes, default: false , null: false
      t.boolean :gender_attribute, default: true , null: false
      t.integer :gym_id

      t.timestamps
    end
  end
end
