class DiagnosisResult < ApplicationRecord
  # 診断結果は特定の診断質問に属する
  validates :result_text, presence: true
  validates :key, presence: true
end
