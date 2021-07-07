class Api::V1::DirectorsController < ApplicationController
  before_action :find_director, only: %i[show destroy]
  before_action :authorize_request, except: %i[index]

  def index
    @directors = Director.all.includes(:movies)
    render json: @directors
  end

  def new
  end

  def create
    @director = Director.new(director_params)

    if @director.save
      render json: @director, status: :ok, message: "Success"
    else
      render json: @director.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @director
  end

  def destroy
    @director.destroy
  end

  def top_directors
    @top_directors = Director.all.select{ |x| x.average_rating > 0.750e1 }
    render json: @top_directors, status: :ok, message: "Most Prolific Directors"
  end

  def least_prolific
    people = Director.all.sort_by{ |x| x.movies.count }.slice(0, 5)
    render json: people, status: :ok, message: "Least Prolific directors"
  end

  private

    def find_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.require(:director).permit(:name, :years_active, movie_ids: [])
    end
end
