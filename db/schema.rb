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

ActiveRecord::Schema.define(version: 2019_01_10_114420) do

  create_table "api_tokens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.string "address", null: false
    t.string "postcode", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_clients_on_address"
    t.index ["city"], name: "index_clients_on_city"
    t.index ["code"], name: "index_clients_on_code"
    t.index ["company_id"], name: "index_clients_on_company_id"
    t.index ["country"], name: "index_clients_on_country"
    t.index ["hidden"], name: "index_clients_on_hidden"
    t.index ["name"], name: "index_clients_on_name"
    t.index ["postcode"], name: "index_clients_on_postcode"
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "postcode", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.string "email", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_companies_on_address"
    t.index ["city"], name: "index_companies_on_city"
    t.index ["country"], name: "index_companies_on_country"
    t.index ["hidden"], name: "index_companies_on_hidden"
    t.index ["name"], name: "index_companies_on_name"
    t.index ["postcode"], name: "index_companies_on_postcode"
  end

  create_table "drivers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.index ["client_id"], name: "index_drivers_on_client_id"
    t.index ["company_id"], name: "index_drivers_on_company_id"
    t.index ["first_name"], name: "index_drivers_on_first_name"
    t.index ["hidden"], name: "index_drivers_on_hidden"
    t.index ["last_name"], name: "index_drivers_on_last_name"
  end

  create_table "invitations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.string "role", null: false
    t.integer "client_id"
    t.integer "company_id", null: false
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_invitations_on_client_id"
    t.index ["company_id"], name: "index_invitations_on_company_id"
    t.index ["token"], name: "index_invitations_on_token"
  end

  create_table "notifies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "pin", null: false
    t.string "number", null: false
    t.string "car_number", null: false
    t.string "trailer_number", null: false
    t.datetime "expiration_from", null: false
    t.datetime "expiration_to"
    t.boolean "indefinite", default: false, null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.boolean "active", default: true, null: false
    t.integer "product_id"
    t.integer "driver_id"
    t.integer "user_id", null: false
    t.integer "client_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_notifies_on_active"
    t.index ["car_number"], name: "index_notifies_on_car_number"
    t.index ["client_id"], name: "index_notifies_on_client_id"
    t.index ["company_id"], name: "index_notifies_on_company_id"
    t.index ["created_at"], name: "index_notifies_on_created_at"
    t.index ["driver_id"], name: "index_notifies_on_driver_id"
    t.index ["hidden"], name: "index_notifies_on_hidden"
    t.index ["number"], name: "index_notifies_on_number"
    t.index ["pin"], name: "index_notifies_on_pin"
    t.index ["product_id"], name: "index_notifies_on_product_id"
    t.index ["trailer_number"], name: "index_notifies_on_trailer_number"
    t.index ["user_id"], name: "index_notifies_on_user_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_products_on_code"
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["hidden"], name: "index_products_on_hidden"
    t.index ["name"], name: "index_products_on_name"
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
    t.boolean "hidden", default: false, null: false
    t.datetime "hidden_at"
    t.string "locale", default: "pl", null: false
    t.string "role", default: "user", null: false
    t.integer "client_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["hidden"], name: "index_users_on_hidden"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
