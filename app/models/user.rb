class User < ActiveRecord::Base
  has_many :tweets
  validates :name, presence: :true, length: {in: 2..20}
  validates :surname, presence: :true
  validates :email, presence: :true
  validates :bio, presence: :true
end
