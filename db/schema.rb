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

ActiveRecord::Schema.define(version: 20141026180943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: true do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 100, default: "", null: false
    t.string   "username",        limit: 50
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["username"], name: "index_admin_users_on_username", using: :btree

  create_table "admin_users_products", id: false, force: true do |t|
    t.integer "admin_user_id"
    t.integer "line_id"
  end

  add_index "admin_users_products", ["admin_user_id", "line_id"], name: "index_admin_users_products_on_admin_user_id_and_line_id", using: :btree

  create_table "lines", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible",     default: false
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "gender"
  end

  create_table "products", force: true do |t|
    t.integer  "line_id"
    t.string   "name"
    t.integer  "volume"
    t.integer  "price"
    t.text     "description"
    t.string   "permalink"
    t.integer  "position"
    t.boolean  "visible",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["line_id"], name: "index_products_on_line_id", using: :btree
  add_index "products", ["permalink"], name: "index_products_on_permalink", using: :btree

end
