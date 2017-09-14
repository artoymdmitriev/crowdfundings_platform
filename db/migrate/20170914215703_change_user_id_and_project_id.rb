class ChangeUserIdAndProjectId < ActiveRecord::Migration[5.0]
  def up
    change_column :news_items, :user_id, :integer, null: true
    change_column :news_items, :project_id, :integer, null: true
  end
  def down
    change_column :news_items, :user_id, :integer, null: false
    change_column :news_items, :project_id, :integer, null: false
  end

end
