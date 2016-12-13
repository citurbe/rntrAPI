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

ActiveRecord::Schema.define(version: 20161207151835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.integer "user_id"
    t.string  "address"
    t.string  "zip"
  end

  create_table "apt_amenities", force: :cascade do |t|
    t.integer "apartment_id"
    t.integer "count"
    t.string  "name"
  end

  create_table "apt_commutes", force: :cascade do |t|
    t.integer "apartment_id"
    t.string  "duration"
  end

  create_table "apt_crimes", force: :cascade do |t|
    t.integer "apartment_id"
    t.integer "felonies"
    t.integer "misdemeanors"
    t.integer "violations"
  end

  create_table "apt_schools", force: :cascade do |t|
    t.integer "apartment_id"
    t.integer "a_schools"
    t.integer "b_schools"
    t.integer "c_schools"
    t.integer "d_schools"
    t.integer "f_schools"
  end

  create_table "destinations", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "name"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "email"
    t.text     "password_digest"
    t.integer  "commute"
    t.integer  "amenities"
    t.integer  "schools"
    t.integer  "safety"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "destination"
    t.text     "category_1"
    t.text     "category_2"
    t.text     "category_3"
  end

end
