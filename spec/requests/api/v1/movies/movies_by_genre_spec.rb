require 'rails_helper'

# * An endpoint exists that will list all movies by a genre
# * List is paginated: 50 movies per page, the page can be altered with the `page` query params
# * Columns include: imdb id, title, genres, release date, budget

RSpec.describe 'Movies by genre' do
  describe 'As a user' do
    before :each do
      5.times { create(:movie, genres: "[{:id=>18, :name=>\"Drama\"}, {:id=>35, :name=>\"Comedy\"}]") }
      51.times { create(:movie, genres: "[{:id=>28, :name=>\"Action\"}, {:id=>53, :name=>\"Thriller\"}, {:id=>80, :name=>\"Crime\"}]") }
    end

    it "can get a list of movies by genre" do
      params = {
        'genres' => 'action',
        'page' => 1
      }
      get "/api/v1/movies/find_all", params: params
      movies_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(movies_json[:data].count).to eq(50)

      all_action = movies_json[:data].all? do |movie|
        movie[:attributes][:genres].downcase.include?('action')
      end

      expect(all_action).to eq(true)

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
