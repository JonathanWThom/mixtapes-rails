require 'rails_helper'

describe 'the reviews path' do
  before() do
    user = User.create(name: 'James')
    @mixtape = user.mixtapes.create(title: 'Notorious MVC', image: 'win.jpg', subgenre: 'Epic Music', year: 1990)
  end

  it 'will leave a review' do
    visit mixtape_path(@mixtape)
    fill_in 'Content', :with => 'This album is hot fiyah'
    click_on 'Create Review'
    expect(page).to have_content('This album is hot fiyah')
  end

  it 'will fail to leave a review' do
    visit mixtape_path(@mixtape)
    click_on 'Create Review'
    expect(page).to have_content('Please fill in your review')
  end
end
