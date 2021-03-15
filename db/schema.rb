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

ActiveRecord::Schema.define(version: 2021_03_12_071615) do

  create_table "allergies", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.integer "period"
    t.string "subject"
    t.string "teacher"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_classrooms_on_user_id"
  end

  create_table "classrooms_students", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "classroom_id", null: false
    t.index ["classroom_id", "student_id"], name: "index_classrooms_students_on_classroom_id_and_student_id"
    t.index ["student_id", "classroom_id"], name: "index_classrooms_students_on_student_id_and_classroom_id"
  end

  create_table "severities", force: :cascade do |t|
    t.string "level"
    t.integer "allergy_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["allergy_id"], name: "index_severities_on_allergy_id"
    t.index ["student_id"], name: "index_severities_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "grade"
    t.string "lunch_period"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "classrooms", "users"
  add_foreign_key "severities", "allergies"
  add_foreign_key "severities", "students"
end
