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
      t.integer :product_id,              null: true
      t.integer :driver_id,               null: true
      t.integer :user_id,                 null: false, default: nil
      t.integer :client_id,               null: false
      t.integer :company_id,              null: false

      t.timestamps
    end
  end
end
