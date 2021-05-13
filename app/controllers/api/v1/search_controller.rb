class Api::V1::SearchController < ApplicationController

  def search
    #Cast Members => CastMembers
    #Movies => Movies
    #filter is a dropdown menu, form scoped under :search
    if params[:search][:filter]
      if params[:search][:term]
        filter = params[:search][:filter].gsub(" ", "")
        @results = Object.const_get(filter)
                         .where("name LIKE ?", "%#{params[:search][:term]}%")
        render json: @results, status: :ok, message: "Search Results"
      else
        render json: { status: "error", message: "Please enter a Search Term" }
      end
    else
      render json: { status: "error", message: "Please Use A Filter" }
    end

  end

end
