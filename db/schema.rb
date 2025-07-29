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

ActiveRecord::Schema[8.0].define(version: 2025_07_26_113806) do
  create_table "assistantcourses", force: :cascade do |t|
    t.integer "assistant_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assistant_id"], name: "index_assistantcourses_on_assistant_id"
    t.index ["course_id"], name: "index_assistantcourses_on_course_id"
  end

  create_table "connections", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "assistant_id", null: false
    t.text "course_ids"
    t.text "problem_description"
    t.string "telegram_username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assistant_id"], name: "index_connections_on_assistant_id"
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "year"
    t.integer "semester"
    t.string "description"
    t.integer "credit_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "academic_year"
  end

  add_foreign_key "assistantcourses", "courses"
  add_foreign_key "assistantcourses", "users", column: "assistant_id"
  add_foreign_key "connections", "users", column: "assistant_id"
  add_foreign_key "connections", "users"
end
