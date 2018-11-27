class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :street
      t.string :number
      t.string :postcode
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
