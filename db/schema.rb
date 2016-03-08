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

ActiveRecord::Schema.define(version: 2) do

  create_table "patterns", force: :cascade do |t|
    t.string  "pattern_name"
    t.string  "pattern_category"
    t.boolean "free_pattern"
    t.string  "pattern_url"
    t.string  "suggested_yarn"
    t.string  "yarn_weight"
    t.string  "guage"
    t.string  "needle_size"
    t.integer "yardage"
    t.string  "pattern_notes"
    t.string  "password_digest"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end