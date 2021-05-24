class Api::V1::Movies::LikesController < Api::V1::LikesController
  before_action :set_likable

  private

    def set_likable
      @likable = Movie.find(params[:movie_id])
    end

end
