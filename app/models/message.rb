class Message < ApplicationRecord
  belongs_to :user
  belongs_to :home
  has_one_attached :image

  validates :user_id, presence: true
  validates :home_id, presence: true
  validates :comment, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
