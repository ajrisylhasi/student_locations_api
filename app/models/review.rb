class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  before_create do
    self.name = 0
  end
end
