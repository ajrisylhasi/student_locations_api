class Place < ApplicationRecord
  has_many :reviews, as: :reviewable
  has_many :events
end
