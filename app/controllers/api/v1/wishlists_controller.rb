class Api::V1::WishlistsController < ApplicationController


  def create
    @wishlist = current_user.wishlist.build(wishlist_params)

    if @wishlist.save
      render json: @wishlist
    else
      render json: @wishlist.errors, status: :unprocessable_entity
    end

  end

  private

    def wishlist_params
      params.require(:wishlist).permit(:user_id, movie_ids: [])
    end

end
