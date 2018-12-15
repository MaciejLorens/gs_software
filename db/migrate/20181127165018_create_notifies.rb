class CreateNotifies < ActiveRecord::Migration[5.2]
  def change
    create_table :notifies do |t|
      t.string :pin,                      null: false
      t.string :number,                   null: false
      t.string :car_number,               null: false
      t.string :trailer_number,           null: false
      t.datetime :expiration_from,        null: false
      t.datetime :expiration_to,          null: true
      t.boolean :indefinite,              null: false, default: false
      t.boolean :hidden,                  null: false, default: false
      t.datetime :hidden_at,              null: true
      t.boolean :active,                  null: false, default: true
      t.integer :product_id,              null: false
      t.integer :driver_id,               null: true
      t.integer :user_id,                 null: false, default: nil
      t.integer :client_id,               null: false
      t.integer :company_id,              null: false

      t.timestamps
    end

    # === TODO:Maciej: fix DB issue with lenght
    # add_index :notifies, :product_id,     unique: false
    # add_index :notifies, :driver_id,      unique: false
    # add_index :notifies, :user_id,        unique: false
    # add_index :notifies, :company_id,     unique: false
    # add_index :notifies, :hidden,         unique: false
    # add_index :notifies, :created_at,     unique: false
    # add_index :notifies, :active,         unique: false

  end
end
