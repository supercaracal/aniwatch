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

ActiveRecord::Schema.define(version: 20131006142809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string   "code",       null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "day_of_weeks", force: :cascade do |t|
    t.string   "code",       null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lineups", force: :cascade do |t|
    t.string   "title",          null: false
    t.time     "start_time",     null: false
    t.integer  "channel_id",     null: false
    t.integer  "day_of_week_id", null: false
    t.integer  "point"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["channel_id"], name: "index_lineups_on_channel_id", using: :btree
    t.index ["day_of_week_id"], name: "index_lineups_on_day_of_week_id", using: :btree
  end

  add_foreign_key "lineups", "channels"
  add_foreign_key "lineups", "day_of_weeks"
end
