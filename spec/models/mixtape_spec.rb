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

  describe '.year_sort' do
    it 'will sort by year descending' do
      user = User.create(name: 'JT')
      mixtape1 = user.mixtapes.create(title: 'B', year: 1990, subgenre: 'Hot Fiyah', image: 'image here')
      mixtape2 = user.mixtapes.create(title: 'A', year: 2000, subgenre: 'Hot Fiyah', image: 'image here')
      expect(Mixtape.year_sort).to(eq([mixtape2, mixtape1]))
    end
  end

  describe '.unique_subgenres' do
    it 'will return all unique subgenres' do
      user = User.create(name: 'JT')
      mixtape1 = user.mixtapes.create(title: 'B', year: 1990, subgenre: 'Hot Fiyah', image: 'image here')
      mixtape2 = user.mixtapes.create(title: 'A', year: 2000, subgenre: 'Hot Fiyah', image: 'image here')
      expect(Mixtape.unique_subgenres).to(eq(['Hot Fiyah']))
    end
  end

  describe '.find_by_subgenre' do
    it 'will return only mixtapes with matching subgenre' do
      user = User.create(name: 'JT')
      mixtape1 = user.mixtapes.create(title: 'B', year: 1990, subgenre: 'Hot Fiyah', image: 'image here')
      mixtape2 = user.mixtapes.create(title: 'A', year: 2000, subgenre: 'Cold Fiyah', image: 'image here')
      expect(Mixtape.find_by_subgenre('Hot Fiyah')).to(eq([mixtape1]))
    end
  end

end
