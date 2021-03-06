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

ActiveRecord::Schema.define(version: 2021_09_06_085151) do

  create_table "accept_conditions", force: :cascade do |t|
    t.integer "user_id"
    t.text "content"
    t.integer "importance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accept_conditions_on_user_id"
  end

  create_table "checks", force: :cascade do |t|
    t.integer "company_id"
    t.integer "accept_condition_id"
    t.integer "accept"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accept_condition_id"], name: "index_checks_on_accept_condition_id"
    t.index ["company_id"], name: "index_checks_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "media"
    t.string "job"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.integer "name"
    t.datetime "date"
    t.integer "is_passed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_events_on_company_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
