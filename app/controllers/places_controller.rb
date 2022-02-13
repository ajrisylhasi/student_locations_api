class PlacesController < ApplicationController
  before_action :find_place, only: [:show, :update, :destroy]

  def create
    @place = Place.new(place_params)
    if @place.save
      render json: @place
    else
      render json: {errors: @place.errors}, status: :unprocessable_entity
    end
  end

  def show
    if @place
      render json: @place
    else
      render json: {errors: "Place not found"}, status: :not_found
    end
  end

  def index
    @places = Place.all
    render json: @places
  end

  def update
    if @place.update(place_params) && @place.save
      render json: @place
    else
      render json: {errors: @place.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    if @place.destroy
      render json: {response: "Place deleted successfuly"}
    else
      render json: {errors: @place.errors}, status: :unprocessable_entity
    end
  end

  
  private

  def find_place
    @place = Place.find_by_id(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :category)
  end
end
