ActiveRecord::Schema.define(version: 2025_06_05_123456) do
  enable_extension "plpgsql" if defined?(enable_extension)

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false, unique: true
    t.timestamps
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "status", default: "open", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  add_foreign_key "tickets", "users"
end