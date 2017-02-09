require 'rails_helper'

describe 'the show mixtape path' do
  before() do
    user = User.create(name: 'James')
    @mixtape = user.mixtapes.create(title: 'Notorious MVC', image: 'win.jpg', subgenre: 'Epic Music', year: 1990)
  end

  it 'will show a mixtape\'s page' do
    visit mixtapes_path
    click_on 'Notorious MVC'
    expect(page).to have_content('Notorious MVC')
  end

  it 'will rate a mixtape' do
    visit mixtape_path(@mixtape)
    choose 'rating_3'
    click_on 'Rate'
    choose 'rating_4'
    click_on 'Rate'
    expect(page).to have_content('3.5')
  end
end
