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

ActiveRecord::Schema.define(version: 2020_09_28_193404) do

  create_table "bets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.integer "team_id"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "home_score"
    t.integer "away_score"
    t.string "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string "sport_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.integer "sport_id"
    t.string "stadium_name"
    t.string "stadium_img"
    t.string "website"
    t.string "banner"
    t.string "description"
    t.string "badge"
    t.string "fan_art"
    t.string "jersey"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "display_name"
    t.string "password_digest"
    t.integer "basketball_team_id"
    t.integer "football_team_id"
    t.integer "baseball_team_id"
    t.integer "soccer_team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
