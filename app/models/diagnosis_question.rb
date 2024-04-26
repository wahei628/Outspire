class DiagnosisQuestion < ApplicationRecord
  # 各質問には複数の診断結果が関連付けられる
  has_many :diagnosis_results, dependent: :destroy
  # 各質問には複数のユーザー回答が関連付けられる
  has_many :user_answers, dependent: :destroy

  validates :weight, numericality: { greater_than_or_equal_to: 1 }
  validates :category_id, presence: true
end