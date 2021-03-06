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
      (self.rating_sum / self.rating_count).round(2)
    end
  end

  def new_rating(rating_add)
    self.rating_sum += rating_add.to_i
    self.rating_count += 1
  end

  def self.alphabetize
    self.order("lower(title)")
  end

  def self.year_sort
    self.order(year: :desc)
  end

  def self.unique_subgenres
    self.all.map(&:subgenre).uniq
  end

  def self.find_by_subgenre(genre)
     self.where(:subgenre => genre)
  end

  def self.search_query(search_input)
    self.basic_search(search_input)
  end

end
