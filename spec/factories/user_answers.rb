FactoryBot.define do
  factory :user_answer do
    association :user
    association :diagnosis_question
  end
end
