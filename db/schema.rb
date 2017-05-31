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

ActiveRecord::Schema.define(version: 20170531204748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_types", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dance_comments", force: :cascade do |t|
    t.string   "comment",         null: false
    t.integer  "comment_type_id", null: false
    t.integer  "dance_id",        null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "dance_directions", force: :cascade do |t|
    t.integer "dance_id",  null: false
    t.integer "sequence",  null: false
    t.string  "mark"
    t.string  "measure"
    t.text    "direction", null: false
    t.string  "position"
  end

  create_table "dance_levels", force: :cascade do |t|
    t.string "name",        null: false
    t.string "description", null: false
  end

  create_table "dances", force: :cascade do |t|
    t.integer  "user_id",                        null: false
    t.string   "title",                          null: false
    t.string   "choreographer"
    t.integer  "year"
    t.string   "publication"
    t.integer  "formation_id",                   null: false
    t.integer  "meter_id",                       null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "complete",       default: false, null: false
    t.integer  "dance_level_id"
    t.integer  "tempo_id"
    t.integer  "key_id"
  end

  create_table "dances_moods", id: false, force: :cascade do |t|
    t.integer "dance_id", null: false
    t.integer "mood_id",  null: false
  end

  create_table "formations", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "keys", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "meters", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "moods", force: :cascade do |t|
    t.string "name",        null: false
    t.string "description"
  end

  create_table "tempos", force: :cascade do |t|
    t.string "name",        null: false
    t.string "description"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.boolean  "admin",                  default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
