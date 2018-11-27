class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.string :number,                   null: false
      t.string :car_number,               null: false
      t.string :semitrailer_number,       null: false
      t.datetime :expiration_from,        null: false
      t.datetime :expiration_to,          null: false
      t.boolean :hidden
      t.datetime :hidden_at
      t.integer :product_id,              null: false
      t.integer :driver_id,               null: false
      t.integer :user_id,                 null: false, default: nil
      t.integer :company_id,              null: false

      t.timestamps
    end

    add_index :receipts, :product_id, unique: false
    add_index :receipts, :driver_id, unique: false
    add_index :receipts, :company_id, unique: false
    add_index :receipts, :hidden, unique: false
    add_index :receipts, :hidden_at, unique: false
  end
end
