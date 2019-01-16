class SettingsController < ApplicationController

  before_action :authorize_super_admin

  def index
    @token_setting = Setting.token
    @qr_code_size_setting = Setting.qr_code_size
  end

  def refresh_token
    Setting.token.refresh_token

    redirect_to settings_path, notice: t('setting.setting_was_successfully_edited')
  end

  def set_qr_code_size
    Setting.qr_code_size.update(value: params[:value])

    redirect_to settings_path, notice: t('setting.setting_was_successfully_edited')
  end

end
