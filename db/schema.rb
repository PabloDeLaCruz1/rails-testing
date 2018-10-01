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

ActiveRecord::Schema.define(version: 2018_10_01_141204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.string "confirmation", limit: 50
    t.boolean "paid"
    t.integer "number"
    t.datetime "date_created", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "product_orders", id: :serial, force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.datetime "date_created", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "products", id: :serial, force: :cascade do |t|
    t.string "sku", limit: 50
    t.string "name", limit: 50
    t.datetime "date_created", default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "product_orders", "orders", name: "product_orders_order_id_fkey"
  add_foreign_key "product_orders", "products", name: "product_orders_product_id_fkey"
end
