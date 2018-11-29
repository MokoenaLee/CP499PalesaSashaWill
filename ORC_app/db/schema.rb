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

ActiveRecord::Schema.define(version: 20181129194515) do

  create_table "generals", force: :cascade do |t|
    t.string "type_name"
    t.string "staff"
    t.string "date"
    t.string "upstairs"
    t.string "trip_room"
    t.string "nso_room"
    t.string "rented"
    t.string "in_repair"
    t.string "total"
    t.string "track_easy"
    t.string "comparison"
    t.string "notes"
  end

  create_table "sleepings", force: :cascade do |t|
    t.string "type_name"
    t.string "staff"
    t.string "date"
    t.string "upstairs"
    t.string "trip_room"
    t.string "nso_room"
    t.string "rented"
    t.string "in_repair"
    t.string "total"
    t.string "track_easy"
    t.string "comparison"
    t.string "notes"
  end

  create_table "users", force: :cascade do |t|
    t.string "First_Name"
    t.string "Last_Name"
    t.string "Email_Address"
    t.string "Student_ID"
    t.string "phone"
  end

end