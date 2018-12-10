class ApiTokensController < ApplicationController

  before_action :authorize_super_admin

  before_action :set_api_token, only: [:edit, :update]

  def edit
  end

  def update
    @api_token.refresh

    redirect_to action: :edit
  end

  private

  def set_api_token
    @api_token = ApiToken.first
  end

end
