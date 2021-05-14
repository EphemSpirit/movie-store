class Api::V1::CastMembersController < ApplicationController
  before_action :find_cast_member, only: %i[show edit update destroy]

  def index
    @cast_members = CastMember.all.includes(:movies)
    render json: @cast_members, status: :ok, message: "All Cast Members"
  end

  def new
  end

  def create
    @cast_member = CastMember.new(cast_member_params)
    if @cast_member.save
      render json: @cast_member, status: :ok, message: "Cast Member Added!"
    else
      render json: @cast_member.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @cast_member, status: :ok
  end

  def edit
  end

  def update
    if @cast_member.update(cast_member_params)
      render json: @cast_member, status: :ok, message: "Cast Member Updated!"
    else
      render json: @cast_member.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cast_member.destroy
  end

  private

    def find_cast_member
      @cast_member = CastMember.find(params[:id])
    end

    def cast_member_params
      params.require(:cast_member).permit(:name, :age, :trivia_fact, :birthday, :birth_city)
    end


end
