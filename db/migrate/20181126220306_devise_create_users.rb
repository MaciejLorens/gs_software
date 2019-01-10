# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email,                          null: false, default: ''
      t.string :encrypted_password,             null: false, default: ''

      t.string   :reset_password_token,         null: true
      t.datetime :reset_password_sent_at,       null: true

      t.datetime :remember_created_at,          null: true

      t.integer  :failed_attempts, default: 0,  null: false
      t.string   :unlock_token,                 null: true
      t.datetime :locked_at,                    null: true

      t.string :first_name,                     null: false, default: nil
      t.string :last_name,                      null: false, default: nil
      t.boolean :hidden,                        null: false, default: false
      t.datetime :hidden_at,                    null: true
      t.string :locale,                         null: false, default: 'pl'
      t.string :role,                           null: false, default: 'user'
      t.integer :client_id,                     null: true, default: nil
      t.integer :company_id,                    null: true, default: nil

      t.timestamps
    end
  end
end
