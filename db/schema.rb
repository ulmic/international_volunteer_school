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

ActiveRecord::Schema.define(version: 20150701072309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "pages", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.text     "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "email"
    t.text     "password_digest"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "first_name"
    t.text     "patronymic"
    t.text     "last_name"
    t.date     "birth_date"
    t.text     "phone"
    t.text     "social_link"
    t.text     "municipality"
    t.text     "locality"
    t.text     "home_adress"
    t.text     "experience"
    t.text     "reason"
    t.text     "activity_line"
    t.text     "deals"
    t.text     "pluses"
    t.text     "minuses"
    t.text     "type"
    t.boolean  "accept_agreement"
    t.text     "state"
    t.text     "school"
    t.text     "another_line"
    t.text     "organization"
    t.text     "what_you_want"
    t.text     "block"
    t.text     "region"
  end

end
