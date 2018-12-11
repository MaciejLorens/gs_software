class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string :email,          null: false
      t.string :token,          null: false
      t.string :role,           null: false
      t.integer :client_id,     null: true, default: nil
      t.integer :company_id,    null: false
      t.datetime :sent_at,      null: true

      t.timestamps
    end

    # === TODO:Maciej: fix DB issue with lenght
    # add_index :invitations, :email,         unique: false
    # add_index :invitations, :token,         unique: false
    # add_index :invitations, :role,          unique: false
    # add_index :invitations, :company_id,    unique: false

  end
end
