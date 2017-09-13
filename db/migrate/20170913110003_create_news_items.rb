class CreateNewsItems < ActiveRecord::Migration[5.0]
  def change
    create_table :news_items do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :project, index:true, null: false
      t.text :text
      t.timestamps
    end
  end
end
