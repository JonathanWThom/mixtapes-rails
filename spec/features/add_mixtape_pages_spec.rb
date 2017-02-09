require 'rails_helper'

describe 'the add mixtape path' do
  it 'will add a mixtape' do
    user = User.create(name: 'Jonathan')
    visit user_path(user)
    click_link 'Add Mixtape'
    fill_in 'Title', :with => 'MVC'
    fill_in 'Image', :with => 'image-link.com'
    fill_in 'Subgenre', :with => 'Hot Fiyah'
    fill_in 'Year', :with => 2017
    click_on 'Create Mixtape'
    expect(page).to have_content('MVC')
  end

  it 'will fail to create a mixtape' do
    user = User.create(name: 'James')
    visit new_user_mixtape_path(user)
    click_on 'Create Mixtape'
    expect(page).to have_content('errors')
  end

end
