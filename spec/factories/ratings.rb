FactoryBot.define do
  factory :rating do
    rating_id { Faker::Number }
    user_id { 1 }
    movie
    rating { 10 }
  end
end
