require 'rails_helper'

describe 'the add a user process' do
  it 'will add a user' do
    visit users_path
    click_link 'Create a User'
    fill_in 'Name', :with => 'Jonathan'
    click_on 'Create User'
    expect(page).to have_content('Jonathan')
  end
end
