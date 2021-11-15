class BookMark < ApplicationRecord
  validates :user_id, uniqueness: { scope: :makii_id }
end
