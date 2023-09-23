require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'User Name', posts_counter: 0) }
  let(:post) { Post.create(title: 'Post Title', author: user) }

  subject { described_class.new(user:, post:, likes_counter: 0) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid with a negative likes_counter' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is valid with a positive likes_counter' do
    subject.likes_counter = 1
    expect(subject).to be_valid
  end

  it 'updates the likes_counter for the associated post' do
    subject.save
    expect(post.reload.likes_counter).to eq(1)
  end

  describe '#update_likes_counter' do
    it 'updates the likes_counter for the associated post' do
      subject.save
      expect(post.reload.likes_counter).to eq(1)
    end
  end
end
