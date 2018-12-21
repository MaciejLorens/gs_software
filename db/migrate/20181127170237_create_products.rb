class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :code,                     null: false
      t.string :name,                     null: false
      t.boolean :hidden,                  null: false, default: false
      t.datetime :hidden_at,              null: true
      t.integer :company_id,              null: false

      t.timestamps
    end

    add_index :products, :code,           unique: false
    add_index :products, :name,           unique: false
    add_index :products, :hidden,         unique: false
    add_index :products, :company_id,     unique: false

  end
end
