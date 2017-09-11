class CreatePassports < ActiveRecord::Migration[5.0]
  def change
    create_table "passports", force: :cascade do |t|
      t.string  "name",     null: false
      t.string  "surname",  null: false
      t.string  "pic_link", null: false
      t.date    "birthday", null: false
      t.text    "comment"
      t.integer "user_id"
      t.index ["user_id"], name: "index_passports_on_user_id"
    end
  end
end