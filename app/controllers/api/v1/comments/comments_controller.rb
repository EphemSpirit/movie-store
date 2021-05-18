class Api::V1::Comments::CommentsController < Api::V1::CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Comment.find(params[:comment_id])
    end
end
