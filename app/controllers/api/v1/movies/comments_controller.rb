class Api::V1::Movies::CommentsController < Api::V1::CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Movie.find(params[:movie_id])
    end
end
