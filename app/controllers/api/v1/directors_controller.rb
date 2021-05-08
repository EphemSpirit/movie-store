class Api::V1::DirectorsController < ApplicationController
  before_action :find_director, only: %i[show destroy]

  def index
    @directors = Director.all
    render json: @directors
  end

  def new
  end

  def create
    @director = Director.create(director_params)

    if @director.save
      render json: @director, status: :ok, message: "Success"
    else
      render json: @director.errors, status: :unprcoessable_entity
    end
  end

  def show
    render json: @director
  end

  def destroy
    @director.destroy
  end

  def top_directors
    @top_directors = Director.all.sort_by{ |x| x.movies.count }.reverse.slice(0, 5)
    render json: @top_directors, status: :ok, message: "Most Prolific Directors"
  end

  private

    def find_director
      @director = Director.find(params[:id])
    end

    def director_params
      params.require(:director).permit(:name, :years_active)
    end
end
