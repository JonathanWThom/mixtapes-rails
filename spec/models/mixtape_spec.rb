require 'rails_helper'

describe Mixtape do

  it {
    should validate_presence_of :title
    should validate_presence_of :image
    should validate_presence_of :subgenre
    should validate_presence_of :year
  }

  it { should belong_to :user }
  it { should have_many :reviews }

  describe '.alphabetize' do
    it 'will sort alphabetically' do
      user = User.create(name: 'JT')
      mixtape1 = user.mixtapes.create(title: 'B', year: 1990, subgenre: 'Hot Fiyah', image: 'image here')
      mixtape2 = user.mixtapes.create(title: 'A', year: 1990, subgenre: 'Hot Fiyah', image: 'image here')
      expect(Mixtape.alphabetize).to(eq([mixtape2, mixtape1]))
    end
  end
end
