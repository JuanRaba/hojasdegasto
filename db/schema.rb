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

ActiveRecord::Schema.define(version: 2018_11_20_153350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asociations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "expenses_sheet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expenses_sheet_id"], name: "index_asociations_on_expenses_sheet_id"
    t.index ["user_id", "expenses_sheet_id"], name: "index_asociations_on_user_id_and_expenses_sheet_id", unique: true
    t.index ["user_id"], name: "index_asociations_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "expenses_sheet_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expenses_sheet_id"], name: "index_expenses_on_expenses_sheet_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "expenses_sheets", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_expenses_sheets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "asociations", "expenses_sheets"
  add_foreign_key "asociations", "users"
  add_foreign_key "expenses", "expenses_sheets"
  add_foreign_key "expenses", "users"
  add_foreign_key "expenses_sheets", "users"
end
