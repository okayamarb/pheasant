# これを使うと、誰でも登録できてしまうので使わない方がいいと思われる。
class RegistrationController < ApplicationController
  def create
    user = User.new(user_params)
    user.ensure_authentication_token
    if user.save
      render json: user.as_json(auth_token: user.authentication_token, email: user.email), status: 201
    else
      warden.custom_failure!
      render json: user.errors, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
