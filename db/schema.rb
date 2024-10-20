ActiveRecord::Schema[8.0].define(version: 2024_10_19_210904) do
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
  end
end
