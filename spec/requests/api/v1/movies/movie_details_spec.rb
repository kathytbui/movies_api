require 'rails_helper'

### Movie Details
AC:

* An endpoint exists that lists the movie details for a particular movie
* Details should include: imdb id, title, description, release date, budget, runtime, average rating, genres, original language, production companies
* Budget should be displayed in dollars
* Ratings are pulled from the rating database

RSpec.describe 'Movie details' do
  describe 'As user' do
    before :each do
      @movie = create(:movie)
      @rating = create(:rating, movie_id: @movie.id)
    end

    it "can get a specific movie's details" do
      get "/api/v1/movies/#{@movie.id}"

      movie_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(movie_json[:data][:id]).to eq("#{@movie.id}")
      expect(movie_json[:data][:type]).to eq('movie')

      expect(movie_json[:data][:attributes][:imdb_id]).to eq(@movie.imdb_id)
      expect(movie_json[:data][:attributes][:title]).to eq(@movie.title)
      expect(movie_json[:data][:attributes][:description]).to eq(@movie.overview)
      expect(movie_json[:data][:attributes][:release_date]).to eq(@movie.release_date)
      expect(movie_json[:data][:attributes][:runtime]).to eq(@movie.runtime)
      expect(movie_json[:data][:attributes][:genres]).to eq(@movie.genres)
      expect(movie_json[:data][:attributes][:original_language]).to eq(@movie.language)
      expect(movie_json[:data][:attributes][:production_companies]).to eq(@movie.production_companies)
      expect(movie_json[:data][:attributes][:average_rating]).to eq(@movie.average_rating)
      expect(movie_json[:data][:attributes][:budget].include?('$')).to eq(true)
    end
  end
end
