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

    # === TODO:Maciej: fix DB issue with lenght
    # add_index :clients, :hidden,  unique: false
    # add_index :clients, :company_id,  unique: false

  end
end
