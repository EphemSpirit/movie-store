class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:show]

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok, message: "User: #{@user.username}"
  end

end
