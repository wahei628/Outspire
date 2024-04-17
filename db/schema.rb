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

ActiveRecord::Schema[7.1].define(version: 2024_04_17_080220) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diagnosis_questions", force: :cascade do |t|
    t.string "question_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnosis_results", force: :cascade do |t|
    t.bigint "diagnosis_question_id"
    t.string "result_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_question_id"], name: "index_diagnosis_results_on_diagnosis_question_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "diagnosis_question_id"
    t.boolean "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_question_id"], name: "index_user_answers_on_diagnosis_question_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "diagnosis_results", "diagnosis_questions"
  add_foreign_key "user_answers", "diagnosis_questions"
  add_foreign_key "user_answers", "users"
end
