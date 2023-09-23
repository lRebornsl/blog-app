class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  attribute :likes_counter, :integer, default: 0

  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_like_counter

  private

  def update_like_counter
    post.update(likes_counter: post.likes.count)
  end
end
