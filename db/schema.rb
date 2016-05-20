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

ActiveRecord::Schema.define(version: 20160519230043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "round_id"
    t.integer  "amount"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "casinos", force: :cascade do |t|
    t.string   "name"
    t.datetime "last_start"
    t.datetime "last_stop"
    t.integer  "money"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "interval"
    t.string   "status"
    t.integer  "singleton_guard"
  end

  add_index "casinos", ["singleton_guard"], name: "index_casinos_on_singleton_guard", unique: true, using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "number"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "casino_id"
  end

end
