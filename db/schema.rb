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

ActiveRecord::Schema.define(:version => 20130922080052) do

  create_table "flights", :force => true do |t|
    t.string   "flight_no"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pairings", :force => true do |t|
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.string   "phone_virtual"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "riders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "flight_id"
    t.string   "final_dest"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "phone_no"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
