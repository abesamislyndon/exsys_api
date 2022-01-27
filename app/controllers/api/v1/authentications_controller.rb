class Api::V1::AuthenticationsController < Api::ApplicationController
 
  def authenticate_user
    user = User.find_for_database_authentication(username: params[:username])
    if user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
        auth_token: JsonWebToken.encode({user_id: user.id}),
        auth_status: "authenticated",
        user: {
            id: user.id,  username: user.username, name: user.email.split('@')[0].try(:titleize)
        }
    }
  end
end