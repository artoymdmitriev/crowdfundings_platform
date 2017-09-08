class UpdateUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.column :is_blocked, :boolean, default: false, null: false
    end
  end
end
