# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_21_212145) do
  create_table "guests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "start_at", null: false
    t.datetime "end_at", null: false
    t.integer "guest_count", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "venues_id", null: false
    t.integer "guests_id", null: false
    t.index ["guests_id"], name: "index_reservations_on_guests_id"
    t.index ["venues_id"], name: "index_reservations_on_venues_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservations", "guests", column: "guests_id"
  add_foreign_key "reservations", "venues", column: "venues_id"
end
