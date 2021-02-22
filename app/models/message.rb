class Message < ApplicationRecord
  belongs_to :user
  belongs_to :home

  validates :user_id, presence: true
  validates :home_id, presence: true
  validates :comment, presence: true
end
