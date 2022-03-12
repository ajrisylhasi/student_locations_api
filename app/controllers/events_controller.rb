class EventsController < ApplicationController
  before_action :find_event, only: %i[show update destroy users participations]

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event
    else
      render json: {errors: @event.errors}, status: :unprocessable_entity
    end
  end

  def show
    if @event
      render json: @event
    else
      render json: {errors: "Event not found"}, status: :not_found
    end
  end

  def index
    @events = Event.all
    render json: @events
  end

  def update
    if @event.update(event_params) && @event.save
      render json: @event
    else
      render json: {errors: @event.errors}, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.destroy
      render json: {response: "Event deleted successfuly"}
    else
      render json: {errors: @event.errors}, status: :unprocessable_entity
    end
  end

  def users
    if @event
      render json: @event.users
    else
      render json: {errors: "Event not found"}, status: :not_found
    end
  end

  def participations
    if @event
      render json: @event.participations
    else
      render json: {errors: "Event not found"}, status: :not_found
    end
  end

  private

  def find_event
    @event = Event.find_by_id(params[:id]) || Event.find_by_id(params[:event_id])
  end

  def event_params
    params.require(:event).permit(:name, :place_id)
  end
end
