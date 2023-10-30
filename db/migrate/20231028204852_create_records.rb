class CreateRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :records do |t|
      t.string :begin_date
      t.string :end_date
      t.integer :client_id
      t.text :goal
      t.string :interval
      t.integer :employee_id

      t.timestamps
    end
  end
end
