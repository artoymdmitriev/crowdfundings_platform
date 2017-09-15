# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170915002252) do

  create_table "applications", force: :cascade do |t|
    t.string  "name",                           null: false
    t.string  "surname",                        null: false
    t.string  "passport_image",                 null: false
    t.date    "birthday",                       null: false
    t.text    "comment"
    t.integer "user_id",                        null: false
    t.boolean "is_confirmed",   default: false, null: false
    t.boolean "is_checked",     default: false, null: false
    t.index ["user_id"], name: "index_applications_on_user_id", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "news_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_news_items_on_project_id"
    t.index ["user_id"], name: "index_news_items_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.text     "message",                    null: false
    t.boolean  "is_shown",   default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount",     precision: 12, scale: 3
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.integer  "project_id"
    t.index ["project_id"], name: "index_payments_on_project_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.date     "fundings_deadline"
    t.text     "description"
    t.string   "pic_link"
    t.integer  "raitings",                                   default: 0
    t.boolean  "is_funded",                                  default: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.integer  "user_id"
    t.decimal  "goal",              precision: 12, scale: 3
    t.decimal  "min_payment",       precision: 12, scale: 3
    t.decimal  "max_payment",       precision: 12, scale: 3
    t.decimal  "earned",            precision: 12, scale: 3, default: "0.0"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "role",                   default: 0,     null: false
    t.integer  "raitings",               default: 0,     null: false
    t.boolean  "is_blocked",             default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
