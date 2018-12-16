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

ActiveRecord::Schema.define(version: 20181214041940) do

  create_table "administrators", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true

  create_table "bulks", force: :cascade do |t|
    t.string  "Gear_Type"
    t.string  "Gear_Category"
    t.integer "Quantity"
    t.string  "location"
    t.string  "Notes"
    t.boolean "Bulk"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "user_id"
    t.string  "blahID"
    t.boolean "Bulk"
    t.string  "Gear_Type"
    t.string  "Brand"
    t.string  "Size"
    t.string  "Serial_Number"
    t.string  "Date_Purchased"
    t.string  "Gear_Category"
    t.string  "Location"
    t.boolean "Available"
    t.text    "Notes"
  end

  add_index "inventories", ["user_id"], name: "index_inventories_on_user_id"

  create_table "pricings", force: :cascade do |t|
    t.string "Gear_Type"
    t.string "daily"
    t.string "weekly"
  end

  create_table "rentals", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "student_ID"
    t.string   "phone"
    t.integer  "iclass"
    t.string   "blahID"
    t.string   "Gear_Type"
    t.string   "rental_date"
    t.integer  "days_used"
    t.string   "return_date"
    t.string   "on_time_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "inventory_id"
  end

  add_index "rentals", ["blahID"], name: "index_rentals_on_blahID"
  add_index "rentals", ["iclass"], name: "index_rentals_on_iclass"
  add_index "rentals", ["inventory_id"], name: "index_rentals_on_inventory_id"
  add_index "rentals", ["user_id"], name: "index_rentals_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email_address"
    t.string  "student_ID",    null: false
    t.string  "phone"
    t.integer "iclass"
  end

end
