require 'rails_helper'

describe User do

  it { should validate_presence_of :name}
  it { should have_many :mixtapes }
  it { should have_many :reviews }
  it { should have_many(:mixtapes).through(:reviews) }

end
