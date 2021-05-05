class Api::V1::MoviesController < ApplicationController
  before_action :find_movie, only: %i[show edit update destroy]

  def index
    movies = Movie.all
    render json: movies
  end

  def new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      render json: @movie, status: :ok, message: "Success"
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

  private

    def find_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :genre, :release_date)
    end
end
