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

ActiveRecord::Schema.define(version: 20141205160736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "easy_tokens_tokens", force: true do |t|
    t.string   "value"
    t.string   "description"
    t.string   "owner_id"
    t.datetime "deactivated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prop_receivers", force: true do |t|
    t.integer "prop_id"
    t.integer "user_id"
  end

  add_index "prop_receivers", ["prop_id", "user_id"], name: "index_prop_receivers_on_prop_id_and_user_id", unique: true, using: :btree
  add_index "prop_receivers", ["prop_id"], name: "index_prop_receivers_on_prop_id", using: :btree
  add_index "prop_receivers", ["user_id"], name: "index_prop_receivers_on_user_id", using: :btree

  create_table "props", force: true do |t|
    t.integer  "user_id"
    t.integer  "propser_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "upvotes_count", default: 0
  end

  add_index "props", ["propser_id"], name: "index_props_on_propser_id", using: :btree
  add_index "props", ["user_id"], name: "index_props_on_user_id", using: :btree

  create_table "upvotes", force: true do |t|
    t.integer  "user_id"
    t.integer  "prop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "upvotes", ["prop_id"], name: "index_upvotes_on_prop_id", using: :btree
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",      default: true
  end

end
