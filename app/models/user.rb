class User < ActiveRecord::Base
  validates :name, :presence => true
  has_many :mixtapes
  has_many :reviews
  has_many :mixtapes, through: :reviews
end
