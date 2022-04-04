class Event < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :participations
  belongs_to :place

  validates :name, presence: true, allow_blank: false
end
