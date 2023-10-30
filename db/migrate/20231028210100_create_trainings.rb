class CreateTrainings < ActiveRecord::Migration[7.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.integer :record_id

      t.timestamps
    end
  end
end
