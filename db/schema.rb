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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110205175412) do

  create_table "announcements", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "lecture_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "commentable_type", :default => "Post"
  end

  create_table "downloads", :force => true do |t|
    t.string   "name"
    t.integer  "lecture_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.text     "description"
    t.string   "document"
    t.integer  "user_id",     :default => 1
    t.boolean  "public",      :default => false, :null => false
  end

  create_table "group_applications", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "lecture_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lectures", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "user_id"
    t.text     "description"
    t.integer  "semester",    :default => 0
    t.integer  "tug_corg"
    t.integer  "tug_clvnr"
    t.integer  "uni_corg"
    t.integer  "uni_clvnr"
  end

  create_table "links", :force => true do |t|
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "name"
    t.integer  "lecture_id"
    t.boolean  "public",     :default => false, :null => false
  end

  create_table "mylinks", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "static_links", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "priority",   :default => 0, :null => false
  end

  create_table "statics", :force => true do |t|
    t.string   "title",                     :null => false
    t.text     "body",                      :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "priority",   :default => 0, :null => false
  end

  create_table "timers", :force => true do |t|
    t.integer  "group_id"
    t.datetime "deadline"
    t.text     "content"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "link",       :default => ""
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.integer  "role_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "active",            :default => false, :null => false
    t.string   "login"
    t.datetime "last_request_at"
    t.string   "last_login_ip"
    t.integer  "login_count"
    t.string   "current_login_ip"
  end

end
