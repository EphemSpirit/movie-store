class Api::V1::WishlistsController < ApplicationController
  before_action :find_wishlist, only: %i[show, add_movie, destroy]

  def add_movie
    @wishlist.movies << movie.id
    render json: @wishlist, status: :ok
  end

  def remove_movie(movie)
    @wishlist.movies.delete{ |x| x.id == movie.id }
    render json: @wishlist, status: :ok
  end

  def create
    @wishlist = current_api_v1_user.wishlist.build(wishlist_params)

    if @wishlist.save
      render json: @wishlist
    else
      render json: @wishlist.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @wishlist
  end

  def update
    @wishlist.movies.update(movie_params)
    render json: @wishlist
  end

  def delete
    if @wishlist.destroy
      render json: { message: "Wishlist deleted", status: 302 }
    else
      render json: @wishlist.errors, status: :unprocessable_entity
    end
  end

  private

    def wishlist_params
      params.require(:wishlist).permit(:user_id, movie_ids: [])
    end

    def find_wishlist
      @wishlist = Wishlist.find(params[:id])
    end

end
