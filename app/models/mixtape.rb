class Mixtape < ActiveRecord::Base
  validates :title, :image, :subgenre, :year, :rating_sum, :rating_count, :presence => true
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :user
end
