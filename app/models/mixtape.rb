class Mixtape < ActiveRecord::Base
  validates :title, :image, :subgenre, :year, :presence => true
  belongs_to :user
  has_many :reviews
  # has_many :users, through: :reviews
  # after_initialize :set_defaults, unless: :persisted?
  #
  # def set_defaults
  #   self.rating_sum = 0 if self.new_record?
  #   self.rating_count = 0 if self.new_record?
  # end

  def rating
    if self.rating_sum > 0 && self.rating_count > 0
      self.rating_sum / self.rating_count
    end
  end

  def new_rating(rating_add)
    puts "rating: ",rating_add
    puts "rating_sum before: ", self.rating_sum
    self.rating_sum += rating_add.to_i
    puts "rating_sum after: ", self.rating_sum

    self.rating_count += 1
  end

end
