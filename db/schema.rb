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

ActiveRecord::Schema.define(version: 20180611235005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breads", force: :cascade do |t|
    t.string "string"
    t.string "name"
    t.string "int"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "burger_fill_types", force: :cascade do |t|
    t.bigint "burger_type_id"
    t.bigint "burger_fill_id"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["burger_fill_id"], name: "index_burger_fill_types_on_burger_fill_id"
    t.index ["burger_type_id"], name: "index_burger_fill_types_on_burger_type_id"
  end

  create_table "burger_fills", force: :cascade do |t|
    t.string "fill_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "burger_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_contacts", force: :cascade do |t|
    t.string "email"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_messeges", force: :cascade do |t|
    t.string "messege"
    t.boolean "start_messege"
    t.boolean "last_messege"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.boolean "logo"
    t.boolean "galery"
    t.boolean "background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean "home"
  end

  create_table "potatos", force: :cascade do |t|
    t.integer "price"
    t.string "weight"
    t.integer "units"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_media", force: :cascade do |t|
    t.string "link"
    t.boolean "facebook"
    t.boolean "instagram"
    t.boolean "twitter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits_counters", force: :cascade do |t|
    t.integer "home"
    t.integer "menu"
    t.integer "contact"
    t.integer "galery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "welcome_data", force: :cascade do |t|
    t.string "messege"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
