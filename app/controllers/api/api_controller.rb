class Api::ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user

  private

  def secret_key_base
    Rails.application.secret_key_base
  end

  def authenticate_user
    authenticate_or_request_with_http_token do |token|
      begin
        jwt_payload = JWT.decode(token, secret_key_base).first

        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end
    end
  end

  def current_user
    @current_user ||= User.find(@current_user_id)
  end

  def jwt_token(user)
    JWT.encode(
      {
        id: user.id,
        exp: 60.days.from_now.to_i
      }, secret_key_base
    )
  end
end
