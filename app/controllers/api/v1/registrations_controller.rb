class Api::V1::RegistrationsController < Api::ApiController
  skip_before_action :authenticate_user, only: :create

  def create
    user = User.create(user_params)
    if user.valid?
      render json: { user: user.as_json, token: jwt_token(user) }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
