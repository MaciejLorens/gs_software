class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :code,               null: false
      t.string :name,               null: false
      t.string :address,            null: false
      t.string :postcode,           null: false
      t.string :city,               null: false
      t.string :country,            null: false
      t.boolean :hidden,            null: false, default: false
      t.datetime :hidden_at,        null: true
      t.integer :company_id,        null: false

      t.timestamps
    end

    add_index :clients, :code,       unique: false
    add_index :clients, :name,       unique: false
    add_index :clients, :address,    unique: false
    add_index :clients, :postcode,   unique: false
    add_index :clients, :city,       unique: false
    add_index :clients, :country,    unique: false
    add_index :clients, :hidden,     unique: false
    add_index :clients, :company_id, unique: false

  end
end
