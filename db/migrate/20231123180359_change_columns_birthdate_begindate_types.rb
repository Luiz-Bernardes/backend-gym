class ChangeColumnsBirthdateBegindateTypes < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :birthdate, 'date USING CAST(birthdate AS date)'
    change_column :users, :begindate, 'date USING CAST(begindate AS date)'
  end
end
