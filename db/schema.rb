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

ActiveRecord::Schema.define(version: 20151208185046) do

  create_table "Events_Teams", id: false, force: :cascade do |t|
    t.integer "team_id",  null: false
    t.integer "event_id", null: false
  end

  create_table "Teams_Users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "team_id", null: false
  end

  create_table "events", force: :cascade do |t|
    t.text     "name"
    t.datetime "date"
    t.text     "image_url"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.integer  "rank"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
