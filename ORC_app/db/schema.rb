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

ActiveRecord::Schema.define(version: 20181210212536) do

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "bulks", force: :cascade do |t|
    t.string  "Gear_Type"
    t.string  "Gear_Category"
    t.integer "Quantity"
    t.string  "location"
    t.string  "Notes"
    t.boolean "Bulk"
  end

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

  create_table "inventories", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "Bulk"
    t.string  "Gear_Type"
    t.string  "Brand"
    t.string  "Model"
    t.string  "Color"
    t.string  "Size"
    t.string  "Quantity"
    t.string  "Serial_Number"
    t.string  "Retail"
    t.string  "Purchase_Price"
    t.string  "Total_Spent"
    t.string  "Date_Purchased"
    t.string  "Purchase_Method"
    t.string  "Reason"
    t.string  "Gear_Category"
    t.string  "Available"
  end

  add_index "inventories", ["user_id"], name: "index_inventories_on_user_id"

  create_table "rentals", force: :cascade do |t|
    t.integer  "user_ID"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "Gear_Type"
    t.string   "Model"
    t.string   "Brand"
    t.string   "rental_date"
    t.string   "return_date"
    t.integer  "days_used"
    t.string   "on_time_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "student_ID"
    t.string "phone"
  end

end
