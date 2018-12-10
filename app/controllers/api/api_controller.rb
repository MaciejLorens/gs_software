class Api::ApiController < ActionController::Base

  before_action :authorize!

  private

  def authorize!
    authenticate_or_request_with_http_token do |token, options|
      return invalid_token unless token == ApiToken.first.value

      true
    end
  end

  def invalid_token
    render json: { error: "Token is invalid, this incident was reported to admin" }, status: 400
  end

end
