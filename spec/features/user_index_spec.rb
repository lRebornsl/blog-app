require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  let!(:user) { User.create(name: 'Andrea', posts_counter: 0) }

  scenario 'I can see the username of all other users' do
    visit users_path
    expect(page).to have_content(user.name)
  end

  scenario 'I can see the profile picture for each user' do
    # Assuming you have a user photo attribute, update the test accordingly
    visit users_path
    expect(page).to have_css("img[src*='#{user.photo}']")
  end

  scenario 'I can see the number of posts each user has written' do
    # Assuming you have a posts_counter attribute on User model
    visit users_path
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  scenario 'When I click on a user, I am redirected to that user\'s show page' do
    visit users_path
    click_link user.name
    expect(current_path).to eq(user_path(user))
  end
end
