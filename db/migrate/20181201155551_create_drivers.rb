class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :company_id

      t.timestamps
    end

    add_index :drivers, :company_id,            unique: false
  end
end
