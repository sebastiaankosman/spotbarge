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

ActiveRecord::Schema.define(version: 2019_08_30_115901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barges", force: :cascade do |t|
    t.string "barge_name"
    t.integer "capacity"
    t.string "pre_cargo"
    t.string "barge_type"
    t.boolean "gas_free"
    t.string "barge_area"
    t.date "barge_load_window"
    t.bigint "broker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["broker_id"], name: "index_barges_on_broker_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "booker_cargo_id"
    t.bigint "booked_cargo_id"
    t.bigint "booker_barge_id"
    t.bigint "booked_barge_id"
    t.integer "freight_rate"
    t.integer "free_hours"
    t.integer "demurrage_rate"
    t.boolean "short_notice"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brokers", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_brokers_on_user_id"
  end

  create_table "cargos", force: :cascade do |t|
    t.string "cargo_name"
    t.string "load_location"
    t.string "cargo_type"
    t.integer "volume"
    t.string "discharge_location"
    t.date "cargo_load_window"
    t.boolean "gas_free"
    t.bigint "oil_company_id"
    t.string "load_latitude"
    t.string "load_longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["oil_company_id"], name: "index_cargos_on_oil_company_id"
  end

  create_table "oil_companies", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_oil_companies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "ice_chat"
    t.string "company_name"
    t.string "type_of_company"
    t.string "country"
    t.string "phone_number"
    t.string "city"
    t.boolean "notification_email"
    t.boolean "notification_sms"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "barges", "brokers"
  add_foreign_key "brokers", "users"
  add_foreign_key "cargos", "oil_companies"
  add_foreign_key "oil_companies", "users"
end
