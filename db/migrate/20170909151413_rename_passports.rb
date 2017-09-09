class RenamePassports < ActiveRecord::Migration[5.0]
  def change
    rename_table :passports, :applications
  end
end
