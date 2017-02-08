class Mixtape < ActiveRecord::Base
  validates :title, :image, :subgenre, :year, :presence => true
  belongs_to :user
  has_many :reviews
  # has_many :users, through: :reviews
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.rating_sum = 0
    self.rating_count = 0
  end

end
