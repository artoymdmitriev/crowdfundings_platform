class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :admin
    change_table :users do |t|
      t.column :role, :integer, default: 0
    end
  end
end
