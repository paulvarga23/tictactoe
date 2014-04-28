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

ActiveRecord::Schema.define(:version => 20140428135339) do

  create_table "moves", :force => true do |t|
    t.integer  "tic_tac_toe_id"
    t.integer  "user_id"
    t.integer  "square"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "tic_tac_toes", :force => true do |t|
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.integer  "winning_player_id"
    t.string   "turn"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "draws"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
