require 'rails_helper'

RSpec.feature 'User Show Page', type: :feature do
  let(:user) { User.create(name: 'Test', posts_counter: 0) }

  scenario 'I can see the user\'s profile picture' do
    visit user_path(user)
    expect(page).to have_css("img[src*='#{user.photo}']")
  end

  scenario 'I can see the user\'s username' do
    visit user_path(user)
    expect(page).to have_content(user.name)
  end

  scenario 'I can see the number of posts the user has written' do
    visit user_path(user)
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  scenario 'I can see the user\'s bio' do
    user.update(bio: 'This is a test bio.')
    visit user_path(user)
    expect(page).to have_content(user.bio)
  end

  scenario 'I can see the user\'s first 3 posts' do
    posts = []
    5.times { |i| posts << Post.create(author_id: user.id, title: "Test #{i}", text: "This is my test #{i}") }
    visit user_path(user)
    user.recent_posts.each do |post|
      expect(page).to have_content(post.title)
    end
  end

  scenario 'I can see a button that lets me view all of a user\'s posts' do
    visit user_path(user)
    expect(page).to have_link('See all posts', href: user_posts_path(user))
  end
end
