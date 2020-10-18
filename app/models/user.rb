class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A[a-z\d]{6,}\z/i
  ZENKAKU = /\A[ぁ-んァ-ヶー一-龠]+\z/
  KANA = /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/

  validates :nickname, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers" }
  validates :family_name, presence: true, format: { with: ZENKAKU, message: "Full-width characters" }
  validates :first_name, presence: true, format: { with: ZENKAKU, message: "Full-width characters" }
  validates :family_name_kana, presence: true, format: { with: KANA, message: "Full-width katakana characters" }
  validates :first_name_kana, presence: true, format: { with: KANA, message: "Full-width katakana characters" }
  validates :birthday, presence: true
end