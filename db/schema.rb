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

ActiveRecord::Schema.define(:version => 20110522184230) do

  create_table "gamenight_invitations", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.integer  "user_inviting_id", :null => false
    t.integer  "gamenight_id",     :null => false
    t.string   "code"
    t.text     "message"
    t.boolean  "is_accepted"
    t.datetime "accepted_at"
  end

  create_table "gamenights", :force => true do |t|
    t.integer  "host_id",       :null => false
    t.string   "name",          :null => false
    t.string   "description"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "players_slots"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gamenights", ["host_id"], :name => "index_gamenights_on_host_id"

  create_table "invitations", :force => true do |t|
    t.integer  "user_id",        :null => false
    t.integer  "user_id_target", :null => false
    t.string   "code"
    t.text     "message"
    t.boolean  "is_accepted"
    t.datetime "accepted_at"
  end

  create_table "invites", :force => true do |t|
    t.integer  "user_id",        :null => false
    t.integer  "user_id_target", :null => false
    t.string   "code"
    t.text     "message"
    t.boolean  "is_accepted"
    t.datetime "accepted_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["username"], :name => "index_users_on_username"

end
