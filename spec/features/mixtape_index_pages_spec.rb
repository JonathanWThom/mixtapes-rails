require 'rails_helper'


describe 'mixtapes path' do
  before() do
    user = User.create(name: 'James')
    mixtape = user.mixtapes.create(title: 'ZVC', image: 'win.jpg', subgenre: 'Epic Music', year: 1990)
    user2 = User.create(name: 'Jonathan')
    mixtape = user2.mixtapes.create(title: 'Notorious CVM', image: 'lose.jpg', subgenre: 'Hot Fiyah', year: 1992)
  end

  it 'will display a list of all mixtapes' do
    visit mixtapes_path
    expect(page).to have_content('ZVC')
    expect(page).to have_content('CVM')
  end

  it 'will alphabetize mixtapes' do
    visit mixtapes_path
    click_on 'Alphabetize'
    expect(page).to have_content('Notorious CVM | 1992 ZVC')
  end

  it 'will sort mixtapes by year descending' do
    visit mixtapes_path
    click_on 'Sort By Year'
    expect(page).to have_content('Notorious CVM | 1992 ZVC')
  end

  it 'will sort mixtapes by subgenre' do
    visit mixtapes_path
    click_on 'Filter'
    expect(page).to have_content('ZVC')
  end

  it 'will search mixtapes by title' do
    visit mixtapes_path
    fill_in 'search_input', :with => 'Notorious'
    click_on 'Search'
    expect(page).to have_content('Notorious CVM')
  end
end
