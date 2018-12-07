class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :first_name,             null: false
      t.string :last_name,              null: false
      t.boolean :hidden,                null: false, default: false
      t.datetime :hidden_at,            null: true
      t.integer :company_id,            null: false

      t.timestamps
    end

    # === TODO:Maciej: fix DB issue with lenght
    # add_index :drivers, :hidden,        unique: false
    # add_index :drivers, :company_id,    unique: false

  end
end
