class UserAnswer < ApplicationRecord
  # ユーザー回答は特定のユーザーに属する
  belongs_to :user
  # ユーザー回答は特定の診断質問に属する
  belongs_to :diagnosis_question
end
