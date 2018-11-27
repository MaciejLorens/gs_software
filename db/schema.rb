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

ActiveRecord::Schema.define(version: 2018_11_27_173121) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "number"
    t.string "postcode"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.boolean "hidden"
    t.datetime "hidden_at"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receipts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "number", null: false
    t.string "car_number", null: false
    t.string "semitrailer_number", null: false
    t.datetime "expiration_from", null: false
    t.datetime "expiration_to", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.integer "product_id", null: false
    t.integer "driver_id", null: false
    t.integer "user_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_receipts_on_company_id"
    t.index ["driver_id"], name: "index_receipts_on_driver_id"
    t.index ["hidden"], name: "index_receipts_on_hidden"
    t.index ["hidden_at"], name: "index_receipts_on_hidden_at"
    t.index ["product_id"], name: "index_receipts_on_product_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "role", default: "client", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
