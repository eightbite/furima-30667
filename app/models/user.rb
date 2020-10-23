class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  ZENKAKU = /\A[ぁ-んァ-ヶー一-龠]+\z/
  KANA = /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/

  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers" }
  with_options presence: true do
    validates :family_name, format: { with: ZENKAKU, message: "Full-width characters" }
    validates :nickname
    validates :first_name, format: { with: ZENKAKU, message: "Full-width characters" }
    validates :family_name_kana, format: { with: KANA, message: "Full-width katakana characters" }
    validates :first_name_kana, format: { with: KANA, message: "Full-width katakana characters" }
    validates :birthday
  end
  has_many :items
end