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

ActiveRecord::Schema.define(version: 20140916200407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assistants_courses", id: false, force: true do |t|
    t.integer "assistant_id"
    t.integer "course_id"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.string   "max_score"
    t.integer  "eval_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments_scores", force: true do |t|
    t.integer "comment_id"
    t.integer "score_id"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_evals", id: false, force: true do |t|
    t.integer "eval_id"
    t.integer "course_id"
  end

  create_table "evals", force: true do |t|
    t.string   "title"
    t.string   "max_score"
    t.integer  "professor_id"
    t.string   "template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", force: true do |t|
    t.string   "title"
    t.string   "final_score"
    t.string   "max_score"
    t.string   "template"
    t.integer  "user_id"
    t.integer  "student_id"
    t.integer  "eval_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rosters", force: true do |t|
    t.integer  "meet_time"
    t.string   "meet_day"
    t.string   "section_name"
    t.string   "location"
    t.integer  "course_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rosters_students", id: false, force: true do |t|
    t.integer "roster_id"
    t.integer "student_id"
  end

  create_table "scores", force: true do |t|
    t.string   "score"
    t.integer  "grade_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "uid"
    t.string   "total_score"
    t.integer  "roster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
