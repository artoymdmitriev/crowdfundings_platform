class ChangeProjectStateToEnum < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :is_funded
    add_column :projects, :state, :integer, default: 0
  end
end
