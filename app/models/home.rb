class Home < ApplicationRecord
  belongs_to :user
  has_many :messages

  validates :name, presence: true, uniqueness: true
end