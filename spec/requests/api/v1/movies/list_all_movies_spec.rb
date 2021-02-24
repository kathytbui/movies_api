require 'rails_helper'

RSpec.describe 'List all movies' do
  describe 'As a user' do
    before :each do
      @movies = create_list(:movie, 60)
    end

    it 'can get a list of all movies' do
      get '/api/v1/movies'
      movies_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(movies_json[:data].size).to eq(50)
    end
  end
end
