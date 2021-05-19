class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_request
  before_action :authenticate_user!

  def index
    @comments = Comment.all.includes(:user, :movie)
    render json: @comments, status: :ok
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.save
    render json: @comment, status: :ok, message: "Comment Posted!"
  end

  def destroy
    @commentable.destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end


end
