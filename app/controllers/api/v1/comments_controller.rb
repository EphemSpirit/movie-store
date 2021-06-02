class Api::V1::CommentsController < ApplicationController
  before_action :authorize_request, except: :index
  #before_action :authenticate_api_v1_user!

  def index
    @comments = Comment.all.includes(:user)
    render json: @comments, status: :ok
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.save
    render json: @comment, status: :ok, message: "Comment Posted!"
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment, status: :ok
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: { message: "Comment deleted", status: :no_content }
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end

end
