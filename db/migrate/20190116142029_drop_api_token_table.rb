class DropApiTokenTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :api_tokens
  end

  def down
    create_table :api_tokens do |t|
      t.string :value

      t.timestamps
    end
  end
end
