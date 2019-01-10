class CreateIndexes < ActiveRecord::Migration[5.2]
  def change

    add_index :users, :unlock_token,            unique: true
    add_index :users, :email,                   unique: true
    add_index :users, :reset_password_token,    unique: true
    add_index :users, :first_name,              unique: false
    add_index :users, :last_name,               unique: false
    add_index :users, :role,                    unique: false
    add_index :users, :hidden,                  unique: false
    add_index :users, :client_id,               unique: false
    add_index :users, :company_id,              unique: false

    add_index :notifies, :pin,                  unique: false
    add_index :notifies, :number,               unique: false
    add_index :notifies, :car_number,           unique: false
    add_index :notifies, :trailer_number,       unique: false
    add_index :notifies, :product_id,           unique: false
    add_index :notifies, :driver_id,            unique: false
    add_index :notifies, :user_id,              unique: false
    add_index :notifies, :active,               unique: false
    add_index :notifies, :hidden,               unique: false
    add_index :notifies, :client_id,            unique: false
    add_index :notifies, :company_id,           unique: false
    add_index :notifies, :created_at,           unique: false

    add_index :products, :code,                 unique: false
    add_index :products, :name,                 unique: false
    add_index :products, :hidden,               unique: false
    add_index :products, :company_id,           unique: false

    add_index :companies, :name,                unique: false
    add_index :companies, :address,             unique: false
    add_index :companies, :postcode,            unique: false
    add_index :companies, :city,                unique: false
    add_index :companies, :country,             unique: false
    add_index :companies, :hidden,              unique: false

    add_index :drivers, :first_name,            unique: false
    add_index :drivers, :last_name,             unique: false
    add_index :drivers, :hidden,                unique: false
    add_index :drivers, :company_id,            unique: false

    add_index :invitations, :token,             unique: false
    add_index :invitations, :client_id,         unique: false
    add_index :invitations, :company_id,        unique: false

    add_index :clients, :code,                  unique: false
    add_index :clients, :name,                  unique: false
    add_index :clients, :address,               unique: false
    add_index :clients, :postcode,              unique: false
    add_index :clients, :city,                  unique: false
    add_index :clients, :country,               unique: false
    add_index :clients, :hidden,                unique: false
    add_index :clients, :company_id,            unique: false

  end
end
