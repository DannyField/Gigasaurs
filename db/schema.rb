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

ActiveRecord::Schema.define(version: 2020_05_12_100531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "band_users", force: :cascade do |t|
    t.bigint "band_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["band_id"], name: "index_band_users_on_band_id"
    t.index ["user_id"], name: "index_band_users_on_user_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.string "profile_picture"
    t.text "about"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gigs", force: :cascade do |t|
    t.string "title"
    t.string "venue"
    t.string "location"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.text "gig_details"
    t.string "support"
    t.integer "tickets_available"
    t.integer "cost"
    t.string "picture_upload"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "band_id", null: false
    t.index ["band_id"], name: "index_gigs_on_band_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "profile_photo"
    t.text "about"
    t.string "location"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "band_users", "bands"
  add_foreign_key "band_users", "users"
  add_foreign_key "gigs", "bands"
end
