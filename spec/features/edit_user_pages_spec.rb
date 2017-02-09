require 'rails_helper'

describe 'the edit user path' do
  it 'will edit a user' do
    user = User.create(name: 'Jonathan')
    visit users_path
    click_link 'Jonathan'
    click_link 'Edit User'
    fill_in 'Name', :with => 'James'
    click_on 'Update User'
    expect(page).to have_content('James')
  end

  it 'will delete a user' do
    user = User.create(name: 'Jonathan')
    visit user_path(user)
    click_link 'Delete User'
    expect(page).to_not have_content('Jonathan')
  end
end
