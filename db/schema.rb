# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_29_040853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "day_of_weeks", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lineups", force: :cascade do |t|
    t.string "title", null: false
    t.time "start_time", null: false
    t.integer "channel_id", null: false
    t.integer "day_of_week_id", null: false
    t.integer "point"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["channel_id"], name: "index_lineups_on_channel_id"
    t.index ["day_of_week_id"], name: "index_lineups_on_day_of_week_id"
  end

  add_foreign_key "lineups", "channels"
  add_foreign_key "lineups", "day_of_weeks"
end
