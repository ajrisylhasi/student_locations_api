class Event < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :participations
  has_many :users, through: :participations
  belongs_to :place
end
