class RolesController < ApplicationController
  # skip_before_action :authenticate_user_from_token!

  before_action :set_role, only: [:show, :update, :destroy]

  def index
    @q = Role.search(params[:q])
    params[:page] ||= 1
    @roles = @q.result.page params[:page]
    render json: @roles
  end

  def create
    @role = Role.new(role_params)

    if @role.save
      render json: @role, status: :created, location: @role
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  def update
    if @role.update(role_params)
      head :no_content
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @role
  end

  def destroy
    @role.destroy
    head :no_content
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name, :code, :memo)
    end
end
