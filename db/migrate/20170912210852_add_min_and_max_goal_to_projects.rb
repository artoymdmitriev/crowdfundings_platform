class AddMinAndMaxGoalToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :min_payment, :decimal, precision: 12, scale: 3
    add_column :projects, :max_payment, :decimal, precision: 12, scale: 3
  end
end
