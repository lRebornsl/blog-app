require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Andrea', posts_counter: 0) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a negative posts_counter' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is valid with a positive posts_counter' do
    subject.posts_counter = 1
    expect(subject).to be_valid
  end

  describe '#recent_posts' do
    it 'returns the 3 most recent posts' do
      user = User.create(name: 'User Name', posts_counter: 0)
      older_post = user.posts.create(title: 'Older Post', text: 'This is an older post.')
      newer_post1 = user.posts.create(title: 'Newer Post 1', text: 'This is a newer post.')
      newer_post2 = user.posts.create(title: 'Newer Post 2', text: 'This is another newer post.')

      recent_posts = user.recent_posts

      expect(recent_posts).to eq([newer_post2, newer_post1, older_post])
    end
  end
end