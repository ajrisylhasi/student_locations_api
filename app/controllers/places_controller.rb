class PlacesController < ApplicationController
  before_action :find_place, only: %i[show update destroy events reviews]
  before_action :authenticate_user!, only: %i[create update destroy]

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
  end

  def events
    if @place
      render json: @place.events
    else
      render json: {errors: "Place not found"}, status: :not_found
    end
  end

  def reviews
    if @place
      render json: @place.reviews
    else
      render json: {errors: "Place not found"}, status: :not_found
    end
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
    @place = Place.find_by_id(params[:id]) || Place.find_by_id(params[:place_id])
  end

  def place_params
    params.require(:place).permit(:name, :category, :lat, :lng)
  end
end
