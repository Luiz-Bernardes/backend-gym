class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :qnt_series
      t.integer :qnt_repetitions

      t.timestamps
    end
  end
end
