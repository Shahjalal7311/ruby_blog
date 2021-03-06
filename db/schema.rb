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

ActiveRecord::Schema.define(version: 2020_12_30_061218) do

  create_table "articles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug"
    t.text "content", limit: 4294967295
    t.text "text"
    t.datetime "published_at"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "catagories_id"
    t.integer "users_id"
    t.string "attachment"
  end

  create_table "catagories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug"
    t.text "content", limit: 4294967295
    t.datetime "published_at"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "users_id"
  end

  create_table "post_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "post_id"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_menu_actions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_menu_id"
    t.integer "menuType"
    t.string "actionName"
    t.string "actionLink"
    t.integer "orderBy"
    t.integer "actionStatus", limit: 1, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "parentMenu"
    t.string "menuName"
    t.string "menuLink"
    t.string "menuIcon"
    t.integer "orderBy"
    t.integer "menuStatus", limit: 1, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "menuType"
    t.text "permission"
    t.text "actionPermission"
    t.integer "status", limit: 1, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "f_name"
    t.string "l_name"
    t.string "user_name"
    t.string "mobile"
    t.integer "user_roles_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
