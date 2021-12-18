class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :makii
  has_many :replies, class_name: 'Comment', foreign_key: :reply_comment, dependent: :destroy

  validates :comment, :presence => {:message => 'コメントを入力してください'}
  # validates :rate, numericality: {
  # less_than_or_equal_to: 5,
  # greater_than_or_equal_to: 1}, presence: true
end
