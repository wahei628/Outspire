class DiagnosisResult < ApplicationRecord
  # 診断結果は特定の診断質問に属する
  belongs_to :diagnosis_question
end
