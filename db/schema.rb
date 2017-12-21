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

ActiveRecord::Schema.define(version: 20171027073005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "code"
    t.string "city"
    t.integer "state_id"
    t.integer "country_id"
    t.integer "time_zone_id"
  end

  create_table "countries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "organizations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "school_id"
    t.string "name"
    t.string "slug"
    t.string "web_address"
    t.string "address"
    t.string "city"
    t.integer "state_id"
    t.integer "country_id"
    t.string "zip"
    t.string "phone"
    t.string "latitude"
    t.string "longitude"
    t.index ["slug", "state_id", "country_id"], name: "index_organizations_on_slug_and_state_id_and_country_id"
  end

  create_table "schools", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "slug"
    t.string "web_address"
    t.string "address"
    t.string "city"
    t.integer "state_id"
    t.integer "country_id"
    t.string "zip"
    t.string "phone"
    t.string "latitude"
    t.string "longitude"
    t.integer "admin_id"
    t.index ["slug", "state_id", "country_id"], name: "index_schools_on_slug_and_state_id_and_country_id"
  end

  create_table "states", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "country_id"
    t.string "abbr"
    t.string "name"
  end

  create_table "time_zones", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "email"
    t.string "remember_token"
    t.string "phone"
    t.boolean "phone_verified", default: false
    t.boolean "phone_unsubscribe", default: false
    t.boolean "gender"
    t.date "birthday"
    t.string "avatar"
    t.boolean "staff", default: false
    t.boolean "active", default: true
    t.string "school"
    t.string "organization"
    t.date "graduation_date"
    t.integer "order_count", default: 0
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "provider"
    t.string "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
