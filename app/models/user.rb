class User < ApplicationRecord
  has_many :reviews
  has_many :participations
  has_many :places
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: {case_sensitive: false}, presence: true, allow_blank: false

  def generate_jwt
    JWT.encode({id:  id,
                exp: 14.days.from_now.to_i},
               Rails.application.secret_key_base)
  end
end
