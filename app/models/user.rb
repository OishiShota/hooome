class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 8 }
  validates :address, presence: true, uniqueness: true
  ADDRESS_REGEX = /\A@+[a-z\d]+\z/i.freeze
  validates_format_of :address, with: ADDRESS_REGEX, message: 'は@半角英数字のみで設定してください' 
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字混合で設定してください' 
end
