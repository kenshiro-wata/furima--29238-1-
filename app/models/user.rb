class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :name, presence: true
  validates :email, confirmation: { case_sensitive: true }, format: { with: VALID_EMAIL_REGEX }
  validates :password, confirmation: true, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birth, presence: true
end
