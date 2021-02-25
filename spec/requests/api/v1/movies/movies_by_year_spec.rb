require 'rails_helper'

# * An endpoint exists that will list all movies from a particular year
# * List is paginated: 50 movies per page, the page can be altered with the `page` query params
# * List is sorted by date in chronological order
# * Sort order can be descending
# * Columns include: imdb id, title, genres, release date, budget

RSpec.describe 'Movie by year' do
  describe 'As a user' do
    before :each do
      50.times { create(:movie, release_date: Time.now.utc + 1.days) }
      @movie2 = create(:movie, release_date: Time.now.utc - 30 .days)
      @movie3 = create(:movie, release_date: Time.now.utc - 20.days)
    end

    it "can get a list of movies by year" do
      get "/api/v1/movies/find_all?release_date=2021?page=1"
      movies_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(movies_json[:data].count).to eq(50)

      first_movie_date = movies_json[:data][0][:attributes][:release_date]
      second_movie_date = movies_json[:data][1][:attributes][:release_date]
      greater_date = second_movie_date > first_movie_date

      expect(greater_date).to eq(true)

      expect(movies_json[:data][0][:type]).to eq('movie')
      expect(movies_json[:data][0][:attributes]).to have_key(:imdb_id)
      expect(movies_json[:data][0][:attributes]).to have_key(:title)
      expect(movies_json[:data][0][:attributes]).to have_key(:genres)
      expect(movies_json[:data][0][:attributes]).to have_key(:release_date)
      expect(movies_json[:data][0][:attributes]).to have_key(:budget)
      expect(movies_json[:data][0][:attributes]).to have_key(:release_date)

      expect(movies_json[:data][0][:attributes][:budget].include?('$')).to eq(true)
    end
  end
end
