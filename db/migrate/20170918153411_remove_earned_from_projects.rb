class RemoveEarnedFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :earned
  end
end
