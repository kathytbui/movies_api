require 'rails_helper'

# * An endpoint exists that lists all movies
# * List is paginated: 50 movies per page, the page can be altered with the `page` query params
# * Columns should include: imdb id, title, genres, release date, budget
# * Budget is displayed in dollars

RSpec.describe 'List all movies' do
  describe 'As a user' do
    before :each do
      @movies = create_list(:movie, 60)
    end

    it 'can get a list of all movies' do
      params = { page: 1 }
      get '/api/v1/movies', params: params
      movies_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(movies_json[:data].size).to eq(50)

      expect(movies_json[:data][0][:type]).to eq('movie')
      expect(movies_json[:data][0][:attributes]).to have_key(:imbd_id)
      expect(movies_json[:data][0][:attributes]).to have_key(:title)
      expect(movies_json[:data][0][:attributes]).to have_key(:genres)
      expect(movies_json[:data][0][:attributes]).to have_key(:release_date)
      expect(movies_json[:data][0][:attributes]).to have_key(:budget)
      expect(movies_json[:data][0][:attributes]).to have_key(:release_date)

      expect(movies_json[:data][0][:attributes][:budget].include?('$')).to eq(true)
    end
  end
end
