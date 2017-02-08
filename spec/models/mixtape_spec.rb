require 'rails_helper'

describe Mixtape do

  it {
    should validate_presence_of :title
    should validate_presence_of :image
    should validate_presence_of :subgenre
    should validate_presence_of :year
    should validate_presence_of :rating_sum
    should validate_presence_of :rating_count
  }


end
