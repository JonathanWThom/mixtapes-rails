class Mixtape < ActiveRecord::Base
  validates :title, :image, :subgenre, :year, :rating_sum, :rating_count, :presence => true
end
