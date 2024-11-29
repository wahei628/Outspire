class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  authenticates_with_sorcery!

  # ユーザーが提出したすべての回答を関連付ける
  has_many :user_answers, dependent: :destroy
  has_many :authentications, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true
end
