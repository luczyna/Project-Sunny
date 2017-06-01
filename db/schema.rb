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

ActiveRecord::Schema.define(version: 20170601050022) do

  create_table "ideas", force: :cascade do |t|
    t.string   "name"
    t.boolean  "published"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "{:foriegn_key=>true}_id"
    t.index ["{:foriegn_key=>true}_id"], name: "index_ideas_on_{:foriegn_key=>true}_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "username"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "{:foreign_key=>true}_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["{:foreign_key=>true}_id"], name: "index_users_on_{:foreign_key=>true}_id"
  end

  create_table "versions", force: :cascade do |t|
    t.integer  "number"
    t.text     "content"
    t.integer  "user_id"
    t.text     "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_versions_on_user_id"
  end

end
