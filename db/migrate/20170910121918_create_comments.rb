class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.belongs_to :user, index: true
      t.integer :commentable_id
      t.string :commentable_type
      t.timestamps
    end
  end
end