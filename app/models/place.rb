class Place < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :events
  belongs_to :user, optional: true
  
  def average_rating
    if !self.reviews.empty?
      self.reviews.map { |r| r.value }.sum / self.reviews.count
    end
  end
end
