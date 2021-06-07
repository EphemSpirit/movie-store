class Api::V1::LikesController < ApplicationController
  #before_action :authenticate_api_v1_user!
  before_action :authorize_request

  def create
    @likeable.likes.new(like_params)
    @likable.save
    render json: @likable, status: :ok, message: "Like posted successfully"
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end

  private

  def like_params
    params.require(:like).permit(:user_id)
  end

end
