class AddRatingsToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.column :raitings, :integer, default: 0, null: false
    end
  end
end
