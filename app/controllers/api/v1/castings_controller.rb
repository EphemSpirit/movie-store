class Api::V1::CastingsController < ApplicationController

  def new
  end

  def create
    @casting = Casting.new(casting_params)
    if @casting.save
      render json: @casting, status: :ok, message: "Part Successfully Cast!"
    else
      render json: @casting.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @casting = Casting.find(params[:id])
    @casting.destroy
  end

  private

    def casting_params
      params.require(:casting).permit(:cast_member_id, :movie_id)
    end

end
