class RemoveGoalFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :goal
  end
end
