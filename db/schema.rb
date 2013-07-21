# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130721060124) do

  create_table "grand_lodges", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbreviation"
  end

  create_table "lodge_event_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lodge_events", force: true do |t|
    t.integer  "lodge_id"
    t.string   "name"
    t.string   "description"
    t.string   "recurrence_rule"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.integer  "lodge_event_category_id"
  end

  add_index "lodge_events", ["lodge_event_category_id"], name: "index_lodge_events_on_lodge_event_category_id"
  add_index "lodge_events", ["lodge_id"], name: "index_lodge_events_on_lodge_id"

  create_table "lodges", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "street_nr"
    t.string   "phone_number"
    t.string   "site_url"
    t.integer  "grand_lodge_id"
    t.integer  "registration_number"
    t.string   "contact_mail"
    t.integer  "user_id"
  end

  add_index "lodges", ["grand_lodge_id"], name: "index_lodges_on_grand_lodge_id"
  add_index "lodges", ["name"], name: "index_lodges_on_name", unique: true
  add_index "lodges", ["registration_number"], name: "index_lodges_on_registration_number", unique: true
  add_index "lodges", ["user_id"], name: "index_lodges_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
