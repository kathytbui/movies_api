FactoryBot.define do
  factory :movie do
    imbd_id { "MyString" }
    title { Faker::Games::Pokemon.name }
    overview { Faker::TvShows::NewGirl.quote }
    production_companies { "MyString" }
    release_date { "MyString" }
    budget { 1000000 }
    revenue { 3000000 }
    runtime { 20 }
    language { "MyString" }
    genres { "MyString" }
    status { "MyString" }
  end
end
