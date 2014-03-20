class ApplicationController < ActionController::API
  #protect_from_forgery with: :null_session
  include Devise::Controllers::Helpers
  skip_before_action :authenticate_user!
  before_action :authenticate_user_from_token!

  private
  def authenticate_user_from_token!
    user_token = params[:token].presence
    user       = user_token && User.find_by(authentication_token: user_token.to_s)

    if user
      sign_in user, store: false
    else
      render status: 403, json: {message: 'Invalid token.'}
    end
  end
end
