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

ActiveRecord::Schema.define(version: 0) do

  create_table "paths", primary_key: "path_id", force: true do |t|
    t.string  "path_name", limit: 512, null: false
    t.integer "share_id",              null: false
    t.integer "server_id",             null: false
  end

  add_index "paths", ["path_name", "share_id", "server_id"], name: "paths_index", length: {"path_name"=>250, "share_id"=>nil, "server_id"=>nil}, using: :btree
  add_index "paths", ["server_id"], name: "server_id", using: :btree
  add_index "paths", ["share_id"], name: "share_id", using: :btree

  create_table "querys", primary_key: "file_id", force: true do |t|
    t.string  "file_name", limit: 512, null: false
    t.integer "path_id",               null: false
    t.integer "share_id",              null: false
    t.integer "server_id",             null: false
  end

  add_index "querys", ["file_name", "path_id", "share_id", "server_id"], name: "files_index", length: {"file_name"=>250, "path_id"=>nil, "share_id"=>nil, "server_id"=>nil}, using: :btree
  add_index "querys", ["path_id"], name: "path_id", using: :btree
  add_index "querys", ["server_id"], name: "server_id", using: :btree
  add_index "querys", ["share_id"], name: "share_id", using: :btree

  create_table "servers", primary_key: "server_id", force: true do |t|
    t.string "ip",       limit: 32,  null: false
    t.string "hostname", limit: 128, null: false
  end

  add_index "servers", ["ip", "hostname"], name: "servers_index", unique: true, using: :btree

  create_table "shares", primary_key: "share_id", force: true do |t|
    t.string  "share_name", limit: 64, null: false
    t.integer "server_id",             null: false
  end

  add_index "shares", ["server_id"], name: "server_id", using: :btree
  add_index "shares", ["share_name", "server_id"], name: "shares_index", unique: true, using: :btree

end
