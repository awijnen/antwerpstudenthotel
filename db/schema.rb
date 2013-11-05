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

ActiveRecord::Schema.define(version: 20131105123624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_requests", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "phone"
    t.string   "country"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservation_types", force: true do |t|
    t.integer  "room_type_id"
    t.string   "length_type"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "price"
    t.integer  "quantity"
    t.integer  "available"
    t.string   "marketing_msg"
    t.string   "marketing_color"
    t.boolean  "sold_out"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "name"
    t.string   "surname"
    t.integer  "age"
    t.string   "street"
    t.integer  "street_nr"
    t.string   "city"
    t.integer  "city_zip"
    t.string   "country"
    t.string   "email"
    t.string   "phone"
    t.string   "university"
    t.text     "comment"
    t.boolean  "approved",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reservation_type_id"
  end

  create_table "room_types", force: true do |t|
    t.text     "description"
    t.integer  "rating"
    t.boolean  "shared_room"
    t.integer  "size"
    t.boolean  "furnished"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
