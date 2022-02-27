class AddReviewableToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :reviewable, polymorphic: true
  end
end
