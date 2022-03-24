class Api::V1::SessionsController < Api::ApiController
  skip_before_action :authenticate_user, only: :create

  def create
    user = User.find_by_email(params[:email])

    if user&.valid_password?(params[:password])
      render json: { user: user.as_json, token: jwt_token(user) }
    else
      render json: { errors: ['email or password is invalid'] }, status: :unprocessable_entity
    end
  end
end
