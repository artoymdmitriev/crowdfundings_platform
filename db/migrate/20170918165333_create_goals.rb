class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.belongs_to :project
      t.decimal :amount, precision: 12, scale: 3
      t.string :description
    end
  end
end
