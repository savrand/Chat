class Event < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  default_scope  { order('created_at DESC') }
end
