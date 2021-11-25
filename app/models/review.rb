class Review < ApplicationRecord
  belongs_to :makii
  validates :user_id,  uniqueness:{scope: :makii_id}
end
