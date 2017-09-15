class AddEarnedToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :earned, :decimal, precision: 12, scale: 3, default: 0
  end
end
