require 'rails_helper'

describe 'the edit mixtape path' do
  it 'will edit a mixtape' do
    user = User.create(name: 'James')
    mixtape = user.mixtapes.create(title: 'MVC', image: 'win.jpg', subgenre: 'Epic Music', year: 1990)
    visit user_path(user)
    click_on 'Edit'
    fill_in 'Title', :with => 'Different Title'
    fill_in 'Image', :with => 'EPIC.jpg'
    fill_in 'Subgenre', :with => 'Epic Music'
    fill_in 'Year', :with => 1991
    click_on 'Update Mixtape'
    expect(page).to have_content('Different Title')
  end

  it 'will fail to edit a mixtape' do
    user = User.create(name: 'James')
    mixtape = user.mixtapes.create(title: 'MVC', image: 'win.jpg', subgenre: 'Epic Music', year: 1990)
    visit edit_user_mixtape_path(user, mixtape)
    fill_in 'Title', :with => ''
    click_on 'Update Mixtape'
    expect(page).to have_content('errors')
  end
end


describe 'the delete mixtape path' do
  it 'will delete a mixtape' do
    user = User.create(name: 'James')
    mixtape = user.mixtapes.create(title: 'MVC', image: 'win.jpg', subgenre: 'Epic Music', year: 1990)
    visit user_path(user)
    click_on 'Delete'
    expect(page).to_not have_content('MVC')
  end
end
