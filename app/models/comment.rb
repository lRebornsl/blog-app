class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  attribute :comments_counter, :integer, default: 0

  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_comment_counter

  private

  def update_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
