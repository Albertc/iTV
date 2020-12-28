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

ActiveRecord::Schema.define(version: 2020_12_28_002705) do

  create_table "contents", charset: "utf8", force: :cascade do |t|
    t.string "plot"
    t.string "title"
    t.bigint "parent_id"
    t.bigint "number"
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_contents_on_parent_id"
  end

  create_table "purchase_options", charset: "utf8", force: :cascade do |t|
    t.decimal "price", precision: 5, scale: 2
    t.string "video_quality", limit: 2
    t.string "purchasable_type", null: false
    t.bigint "purchasable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchasable_type", "purchasable_id"], name: "index_purchase_options_on_purchasable"
  end

  create_table "purchases", charset: "utf8", force: :cascade do |t|
    t.date "expired_at"
    t.bigint "user_id", null: false
    t.bigint "purchase_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchase_option_id"], name: "index_purchases_on_purchase_option_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "contents", "contents", column: "parent_id"
  add_foreign_key "purchases", "purchase_options"
  add_foreign_key "purchases", "users"
end
