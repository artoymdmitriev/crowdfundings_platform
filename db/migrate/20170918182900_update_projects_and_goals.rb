class UpdateProjectsAndGoals < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :goal
    add_column :goals, :is_achieved, :boolean, default: false
  end
end
