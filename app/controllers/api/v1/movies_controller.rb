class Api::V1::MoviesController < ApplicationController
  before_action :find_movie, only: %i[show edit update destroy]

  def index
    movies = Movie.all
    render json: movies, serialzier: MovieSerializer
  end

  def new
  end

  def create
    @movie = Movie.create(movie_params)
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
    @top_movies = Movie.all.order(rating: :desc).limit(10)
    render json: @top_movies
  end

  private

    def find_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :genre, :release_date, :director_id, cast_member_ids: [])
    end
end
