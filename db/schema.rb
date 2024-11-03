# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_11_03_202857) do
  create_table "imported_items", force: :cascade do |t|
    t.integer "imported_list_id", null: false
    t.string "item_type"
    t.string "status", default: "pending"
    t.string "error_message"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imported_list_id"], name: "index_imported_items_on_imported_list_id"
  end

  create_table "imported_lists", force: :cascade do |t|
    t.string "file_name"
    t.string "file_url"
    t.string "status", default: "pending"
    t.string "error_message"
    t.integer "total_rows"
    t.integer "imported_rows"
    t.integer "failed_rows"
    t.string "imported_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.string "image_url"
    t.string "category"
    t.boolean "available"
    t.boolean "is_vegetarian"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "imported_item_id"
    t.index ["imported_item_id"], name: "index_menu_items_on_imported_item_id"
  end

  create_table "menu_menu_item", id: false, force: :cascade do |t|
    t.integer "menu_id", null: false
    t.integer "menu_item_id", null: false
    t.index ["menu_id"], name: "index_menu_menu_item_on_menu_id"
    t.index ["menu_item_id"], name: "index_menu_menu_item_on_menu_item_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "restaurant_id"
    t.integer "imported_item_id"
    t.index ["imported_item_id"], name: "index_menus_on_imported_item_id"
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.string "phone_number"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "imported_item_id"
    t.index ["imported_item_id"], name: "index_restaurants_on_imported_item_id"
  end

  add_foreign_key "imported_items", "imported_lists"
  add_foreign_key "menu_items", "imported_items"
  add_foreign_key "menus", "imported_items"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "restaurants", "imported_items"
end
