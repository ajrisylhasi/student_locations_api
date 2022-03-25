class Place < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :events
  belongs_to :user, optional: true

  def average_rating
    reviews.map {|r| r.value }.sum / reviews.count unless reviews.empty?
  end
end
