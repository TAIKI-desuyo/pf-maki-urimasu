class Makii < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :comments
  has_many :notifications, dependent: :destroy
  has_many :book_marks, dependent: :destroy
  has_many :reviews, foreign_key: "makii_id"

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def book_marked_by?(user)
    book_marks.where(user_id: user).exists?
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(makii_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      makii_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  def average_rate
    if self.reviews.count > 0
      reviews = self.reviews
      sum = 0
      reviews.each do |review|
        sum = sum + review.rate
      end
      sum / reviews.count
    else
      0
    end
  end

end
