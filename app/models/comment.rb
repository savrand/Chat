class Comment < ApplicationRecord
  belongs_to :picture
  belongs_to :user
  validates :user, presence: true
  validates :picture, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 100 }
end
