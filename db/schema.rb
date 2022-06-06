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

ActiveRecord::Schema.define(version: 2022_05_18_003754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "answer_occurrences", force: :cascade do |t|
    t.bigint "class_occurrence_id"
    t.bigint "answer_id"
    t.bigint "student_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_occurrences_on_answer_id"
    t.index ["class_occurrence_id"], name: "index_answer_occurrences_on_class_occurrence_id"
    t.index ["question_id"], name: "index_answer_occurrences_on_question_id"
    t.index ["student_id"], name: "index_answer_occurrences_on_student_id"
  end

  create_table "answers", force: :cascade do |t|
    t.text "description", null: false
    t.boolean "is_correct", default: false
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "class_occurrences", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_class_occurrences_on_classroom_id"
    t.index ["question_id"], name: "index_class_occurrences_on_question_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "access_code"
    t.bigint "user_id"
    t.string "name"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: false
    t.index ["subject_id"], name: "index_classrooms_on_subject_id"
    t.index ["user_id"], name: "index_classrooms_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "description", null: false
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_questions_on_topic_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "registration_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.text "name", null: false
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_subjects_on_course_id"
  end

  create_table "topics", force: :cascade do |t|
    t.text "name", null: false
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_topics_on_subject_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answer_occurrences", "answers"
  add_foreign_key "answer_occurrences", "class_occurrences"
  add_foreign_key "answer_occurrences", "questions"
  add_foreign_key "answer_occurrences", "students"
  add_foreign_key "answers", "questions"
  add_foreign_key "class_occurrences", "classrooms"
  add_foreign_key "class_occurrences", "questions"
  add_foreign_key "classrooms", "subjects"
  add_foreign_key "classrooms", "users"
  add_foreign_key "questions", "topics"
  add_foreign_key "subjects", "courses"
  add_foreign_key "topics", "subjects"
end
