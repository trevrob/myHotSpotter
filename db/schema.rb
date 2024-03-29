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

ActiveRecord::Schema.define(version: 20140326005750) do

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "hotspot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["hotspot_id"], name: "index_comments_on_hotspot_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "hotspots", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  add_index "hotspots", ["user_id"], name: "index_hotspots_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "fb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
