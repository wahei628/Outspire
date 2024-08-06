FactoryBot.define do
  factory :diagnosis_question do
    question_text { "Example question text" }
    points { { "result1" => 3, "result2" => 2, "result3" => 1 } }
  end
end
