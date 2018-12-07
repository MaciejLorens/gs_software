class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :token
      t.integer :company_id
      t.string :role
      t.datetime :sent_at

      t.timestamps
    end

    # === TODO:Maciej: fix DB issue with lenght
    # add_index :invitations, :email,         unique: false
    # add_index :invitations, :token,         unique: false
    # add_index :invitations, :role,          unique: false
    # add_index :invitations, :company_id,    unique: false

  end
end
