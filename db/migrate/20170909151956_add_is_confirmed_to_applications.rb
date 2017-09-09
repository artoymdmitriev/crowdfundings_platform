class AddIsConfirmedToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :is_confirmed, :boolean, default: false, null: false
  end
end
