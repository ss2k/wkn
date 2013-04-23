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

ActiveRecord::Schema.define(:version => 20130423000034) do

  create_table "addresses", :force => true do |t|
    t.string   "address1",         :null => false
    t.string   "address2"
    t.string   "city",             :null => false
    t.string   "state",            :null => false
    t.string   "country",          :null => false
    t.string   "postal_code",      :null => false
    t.integer  "addressable_id",   :null => false
    t.string   "addressable_type", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "addresses", ["address1"], :name => "index_addresses_on_address1"
  add_index "addresses", ["city"], :name => "index_addresses_on_city"
  add_index "addresses", ["postal_code"], :name => "index_addresses_on_postal_code"
  add_index "addresses", ["state"], :name => "index_addresses_on_state"

  create_table "hotspots", :force => true do |t|
    t.string   "name",       :limit => 128, :null => false
    t.string   "group",      :limit => 128
    t.string   "category",   :limit => 128, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "user_id",                   :null => false
  end

  add_index "hotspots", ["category"], :name => "index_hotspots_on_category"
  add_index "hotspots", ["name"], :name => "index_hotspots_on_name", :unique => true

  create_table "landings", :force => true do |t|
    t.integer  "hotspot_id",                 :null => false
    t.string   "title",                      :null => false
    t.text     "markup",     :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "landings", ["hotspot_id", "title"], :name => "index_landings_on_hotspot_id_and_title", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
