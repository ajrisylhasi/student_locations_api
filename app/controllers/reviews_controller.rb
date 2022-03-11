class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[update delete create]
  before_action :set_review, only: %i[show update destroy]

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    return render json: {errors: "Review not found"}, status: :not_found unless @review

    @review.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find_by_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.fetch(:review, {}).permit(:user_id, :reviewable_id, :reviewable_type, :review_text)
  end
end
