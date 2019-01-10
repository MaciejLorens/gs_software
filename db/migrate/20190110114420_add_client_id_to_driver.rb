class AddClientIdToDriver < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :client_id, :integer

    add_index :drivers, :client_id,            unique: false
  end
end
