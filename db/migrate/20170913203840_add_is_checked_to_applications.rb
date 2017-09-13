class AddIsCheckedToApplications < ActiveRecord::Migration[5.0]
  def up
    add_column :applications, :is_checked, :boolean, default: false, null: false
    change_column :applications, :user_id, :integer, null: false
  end

  def down
    remove_column :applications, :is_checked
  end
end
