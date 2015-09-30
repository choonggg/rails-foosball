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

ActiveRecord::Schema.define(version: 20150930081358) do

  create_table "games", force: :cascade do |t|
    t.boolean  "ended",       default: false
    t.integer  "winner_id"
    t.string   "winner_name"
    t.integer  "match_id"
    t.integer  "home_score",  default: 0
    t.integer  "away_score",  default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "games", ["match_id"], name: "index_games_on_match_id"

  create_table "matches", force: :cascade do |t|
    t.integer  "winner_id"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.boolean  "match_over",   default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "matches_teams", id: false, force: :cascade do |t|
    t.integer "match_id"
    t.integer "team_id"
  end

  add_index "matches_teams", ["match_id"], name: "index_matches_teams_on_match_id"
  add_index "matches_teams", ["team_id"], name: "index_matches_teams_on_team_id"

  create_table "memberships", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["team_id"], name: "index_memberships_on_team_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.string   "team_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
