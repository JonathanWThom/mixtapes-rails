class Review < ActiveRecord::Base
  validates :content, :presence => true
  belongs_to :mixtape
  # belongs_to :user
end
