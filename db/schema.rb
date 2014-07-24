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

ActiveRecord::Schema.define(version: 20140723110519) do

  create_table "banners", force: true do |t|
    t.integer "banner_id"
    t.string  "banner_type"
    t.string  "controller"
    t.string  "property_type"
    t.string  "deal_kind"
    t.string  "deal_direction"
    t.integer "count_display"
    t.string  "action_name"
  end

  create_table "flash_banners", force: true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "html_banners", force: true do |t|
  end

  create_table "image_banners", force: true do |t|
    t.string   "url"
    t.string   "click_count"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "positions", force: true do |t|
    t.integer "banner_id"
    t.string  "position"
  end

end
