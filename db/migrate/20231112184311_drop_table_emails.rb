class DropTableEmails < ActiveRecord::Migration[7.1]
  def change
    drop_table :emails
  end
end
