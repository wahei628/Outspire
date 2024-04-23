class DiagnosisQuestion < ApplicationRecord
  # 各質問には複数の診断結果が関連付けられる
  has_many :diagnosis_results, dependent: :destroy
  # 各質問には複数のユーザー回答が関連付けられる
  has_many :user_answers, dependent: :destroy
end