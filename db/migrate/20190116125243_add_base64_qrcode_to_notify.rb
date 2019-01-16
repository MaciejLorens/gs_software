class AddBase64QrcodeToNotify < ActiveRecord::Migration[5.2]
  def change
    add_column :notifies, :base64_qrcode, :text
  end
end
