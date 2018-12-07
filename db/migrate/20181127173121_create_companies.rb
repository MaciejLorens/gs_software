class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name,               null: false
      t.string :address,            null: false
      t.string :postcode,           null: false
      t.string :city,               null: false
      t.string :country,            null: false
      t.string :email,              null: false
      t.boolean :hidden,            null: false, default: false
      t.datetime :hidden_at,        null: true

      t.timestamps
    end

    # === TODO:Maciej: fix DB issue with lenght
    # add_index :companies, :hidden,  unique: false
    # add_index :companies, :email,   unique: true

  end
end
