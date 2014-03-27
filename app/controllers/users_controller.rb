class UsersController < ApplicationController
  # skip_before_action :authenticate_user_from_token!

  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @q = User.search(params[:q])
    params[:page] ||= 1
    @users = @q.result.page params[:page]
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :role_id
    )
  end
end
