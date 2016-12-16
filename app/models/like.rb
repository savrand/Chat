class Like < ApplicationRecord
  belongs_to :user
  belongs_to :picture, counter_cache: true
  validates :user, presence: true
  validates :picture, presence: true
  validates_uniqueness_of :user, scope: :picture
end
