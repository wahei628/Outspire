FactoryBot.define do
  factory :review do
    title { 'Sample Review' }
    content { 'This is a sample review.' }
    association :user
  end
end
