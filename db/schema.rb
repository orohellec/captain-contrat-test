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

ActiveRecord::Schema.define(version: 2019_10_04_134717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fighter_histories", force: :cascade do |t|
    t.bigint "fighter_id"
    t.bigint "history_id"
    t.boolean "win", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fighter_id"], name: "index_fighter_histories_on_fighter_id"
    t.index ["history_id"], name: "index_fighter_histories_on_history_id"
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "health"
    t.integer "attack"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.text "resume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
