class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.decimal :value
      t.decimal :amount_paid
      t.date :payment_date
      t.date :due_date
      t.integer :payment_method_id

      t.timestamps
    end
  end
end
