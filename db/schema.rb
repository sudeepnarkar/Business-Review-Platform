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

ActiveRecord::Schema.define(version: 20160510200604) do

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "lng"
    t.float  "average"
    t.string "address"
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
    t.string "place_id"
  end

  create_table "businesses_types", id: false, force: :cascade do |t|
    t.integer "type_id",     null: false
    t.integer "business_id", null: false
  end

  create_table "distances", force: :cascade do |t|
    t.integer "user_id"
    t.integer "business_id"
    t.float   "dist"
  end

  add_index "distances", ["business_id"], name: "index_distances_on_business_id"
  add_index "distances", ["user_id"], name: "index_distances_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "stars"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "business_id"
    t.datetime "create_date"
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.float    "lat"
    t.float    "lng"
  end

end
