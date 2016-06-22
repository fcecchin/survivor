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

ActiveRecord::Schema.define(version: 20160601205232) do

  create_table "users", force: true do |t|
    t.string   "email",               default: "", null: false
    t.boolean  "admin"
    t.integer  "position"
    t.integer  "score",               default: 0
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "contests", force: true do |t|
    t.string   "name"			, null: false
    t.integer  "user_id"		, null: false
    t.integer  "tournament_id"	, null: false
    t.boolean  "active"			, default: false
    t.boolean  "public"			, default: false
    t.string   "description"	
    t.string   "uid"	
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contests", ["user_id"], name: "index_contests_on_user_id"
  add_index "contests", ["tournament_id"], name: "index_contests_on_tournament_id"
  
  create_table "participants", force: true do |t|
  	t.integer  "user_id",        	  null: false
    t.integer  "contest_id",        null: false
    t.boolean  "active",			      null: false, default: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end
  
  add_index :participants, [:user_id, :contest_id], :unique => true
  
  create_table "tournaments", force: true do |t|
    t.string   "name"
    t.integer  "year"
    t.boolean  "active",     default: true
    t.string   "image",      default: "noimage.jpg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tournaments", ["active"], name: "index_tournaments_on_active"

  create_table "guesses", force: true do |t|
    t.integer  "participant_id"
    t.integer  "match_id"
    t.integer  "goals_a"
    t.integer  "goals_b"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guesses", ["id", "participant_id"], name: "index_guesses_on_id_and_participant_id"
  add_index "guesses", ["match_id"], name: "index_guesses_on_match_id"
  add_index "guesses", ["participant_id"], name: "index_guesses_on_participant_id"
  add_index "guesses", ["team_id"], name: "index_guesses_on_team_id"

  create_table "matches", force: true do |t|
    t.datetime "datetime"
    t.string   "location"
    t.integer  "team_a_id"
    t.integer  "team_b_id"
    t.integer  "goals_a"
    t.integer  "goals_b"
    t.integer  "tournament_id"
    t.integer  "round"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["tournament_id"], name: "index_matches_on_tournament_id"
  add_index "matches", ["team_a_id"], name: "index_matches_on_team_a_id"
  add_index "matches", ["team_b_id"], name: "index_matches_on_team_b_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["slug"], name: "index_teams_on_slug"
  
  create_table "tournament_teams", force: true do |t|
    t.integer  "tournament_id",         default: 0,        null: false
    t.integer  "team_id",               default: 0,        null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.datetime "destroyed_at"
  end
  
  add_index "tournament_teams", ["tournament_id"], name: "index_teams_on_tournament_id", using: :btree
  add_index "tournament_teams", ["team_id"], name: "index_tournaments_on_team_id", using: :btree


end
