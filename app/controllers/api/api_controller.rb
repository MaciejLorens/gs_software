class Api::ApiController < ActionController::Base

  before_action :authorize!

  def not_found
    render json: { error: 'Record not found.' }, status: 404
  end

  def invalid_token
    render json: { error: 'Token is invalid.' }, status: 400
  end

  private

  def authorize!
    authenticate_or_request_with_http_token do |token, options|
      return invalid_token unless token == Setting.token.value

      true
    end
  end

end
