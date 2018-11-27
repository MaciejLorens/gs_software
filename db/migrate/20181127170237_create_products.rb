class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :number
      t.boolean :hidden
      t.datetime :hidden_at
      t.integer :company_id

      t.timestamps
    end
  end
end
