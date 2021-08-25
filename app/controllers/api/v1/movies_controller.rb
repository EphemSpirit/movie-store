class Api::V1::MoviesController < ApplicationController
  before_action :find_movie, only: %i[show edit update destroy]
  before_action :authorize_request, except: %i[index show add_movie remove_movie]
  before_action :authorize_api_v1_user!, only: %[add_movie remove_movie]

  def index
    movies = Movie.all.includes(:director, :cast_members)
    render json: movies, serialzier: MovieSerializer
  end

  def new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: :ok, message: "Success", serializer: MovieSerializer
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @movie
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to api_v1_movies_path
  end

  def top_movies
    @top_movies = Movie.best_films
    render json: @top_movies
  end

  def add_movie
    movie = Movie.find(params[:movie_id])
    current_api_v1_user.wishlist.movies << movie
    render json: current_api_v1_user.wishlist, status: :ok
  end

  def remove_movie
    #movie = Movie.find(params[:movie_id])
    #user.wishlist.movies = user.wishlist.movies.reject{ |x| x.id == params[:movie_id] }
    if current_api_v1_user.wishlist.movies.include?(Movie.find(params[:movie_id]))
      current_api_v1_user.wishlist.movies = current_api_v1_user.wishlist.movies.reject{ |x| x.id == params[:movie_id] }
      render json: current_api_v1_user.wishlist, status: :no_content
    else
      render json: { message: "Something went wrong", status: :unprocessable_entity }
    end
  end

  private

    def find_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:name, :rating, :description, :genre, :release_date, :director_id, cast_member_ids: [])
    end
end
