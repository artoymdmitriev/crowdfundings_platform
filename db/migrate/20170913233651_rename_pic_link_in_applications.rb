class RenamePicLinkInApplications < ActiveRecord::Migration[5.0]
  def change
    rename_column :applications, :pic_link, :passport_image
  end
end
