class AddGoalToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :goal, :decimal, precision: 12, scale: 3
  end
end
