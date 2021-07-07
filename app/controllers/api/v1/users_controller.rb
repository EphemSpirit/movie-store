class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:show]
  #before_action :authorize_request

  # def index
  #   @users = User.all
  #   render json: @users, status: :ok
  # end

  def show
    warden.authenticate!(:api_token)
    @user = User.find(params[:id])
    render json: @user.json, status: :ok, message: "User: #{@user.username}"
  end

end
