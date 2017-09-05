class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :fundings_deadline
      t.text :description
      t.string :pic_link
      t.integer :raitings, default: 0
      t.boolean :is_funded, default: false
      t.timestamps
    end
  end
end
