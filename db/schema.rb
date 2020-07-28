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

ActiveRecord::Schema.define(version: 2020_07_28_145759) do

  create_table "boards", force: :cascade do |t|
    t.integer "project_car_id"
    t.integer "user_id"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_car_id"], name: "index_boards_on_project_car_id"
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "project_cars", force: :cascade do |t|
    t.integer "year"
    t.string "make"
    t.string "model"
    t.string "engine"
    t.string "drivetrain"
    t.string "suspension"
    t.string "wheels_and_tires"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
  end

end
