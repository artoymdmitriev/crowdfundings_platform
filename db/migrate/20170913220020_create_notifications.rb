class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :user, null: false
      t.text :message, null: false
      t.boolean :is_shown, null: false, default: false
      t.timestamps
    end
  end
end
