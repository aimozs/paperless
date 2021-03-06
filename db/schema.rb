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

ActiveRecord::Schema.define(version: 20141119150400) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "clients", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "trainer"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id"

  create_table "exercises", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "video"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id"

  create_table "meal_days", force: true do |t|
    t.string   "day"
    t.date     "date"
    t.string   "breakfast"
    t.string   "lunch"
    t.string   "dinner"
    t.string   "snack"
    t.integer  "meal_plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "meal_days", ["meal_plan_id"], name: "index_meal_days_on_meal_plan_id"
  add_index "meal_days", ["user_id"], name: "index_meal_days_on_user_id"

  create_table "meal_journals", force: true do |t|
    t.integer  "meal_day_id"
    t.date     "date"
    t.string   "meal"
    t.string   "ate"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "day"
  end

  add_index "meal_journals", ["meal_day_id"], name: "index_meal_journals_on_meal_day_id"
  add_index "meal_journals", ["user_id"], name: "index_meal_journals_on_user_id"

  create_table "messages", force: true do |t|
    t.text     "content"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.decimal  "height"
    t.decimal  "weight"
    t.string   "social"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "bodyfat"
    t.text     "injuries"
    t.string   "gender"
    t.text     "engagement"
    t.boolean  "agreed"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "programmes", force: true do |t|
    t.text     "description"
    t.date     "due_date"
    t.string   "programme_status"
    t.integer  "client"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "programmes", ["user_id"], name: "index_programmes_on_user_id"

  create_table "questions", force: true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "relationships", force: true do |t|
    t.integer  "trainer_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["trainer_id", "client_id"], name: "index_relationships_on_trainer_id_and_client_id", unique: true

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "specs", force: true do |t|
    t.time     "time"
    t.integer  "weight"
    t.integer  "set"
    t.integer  "rep"
    t.string   "tempo"
    t.integer  "programme_id"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight_cl"
    t.integer  "set_cl"
    t.integer  "rep_cl"
    t.text     "note"
  end

  add_index "specs", ["exercise_id"], name: "index_specs_on_exercise_id"
  add_index "specs", ["programme_id"], name: "index_specs_on_programme_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
