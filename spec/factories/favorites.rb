FactoryBot.define do
  factory :favorite do
    user { nil }
    place_name { "MyString" }
    place_address { "MyString" }
    place_lat { 1.5 }
    place_lng { 1.5 }
  end
end
