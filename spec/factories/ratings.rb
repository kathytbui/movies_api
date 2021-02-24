FactoryBot.define do
  factory :rating do
    rating_id { 1 }
    user_id { 1 }
    movie_id { 1 }
    rating { 1 }
  end
end
