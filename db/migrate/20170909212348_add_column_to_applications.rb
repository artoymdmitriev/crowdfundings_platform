class AddColumnToApplications < ActiveRecord::Migration[5.0]
  def change
    remove_index :applications, :user_id
    add_index :applications, :user_id, unique: true
  end
end
