require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should have_many :ratings }
  end

  describe 'methods' do
    it "#average_rating" do
      movie = create(:movie)
      rating = create(:rating, movie_id: movie.id)
      rating2 = create(:rating, movie_id: movie.id)

      expect(movie.average_rating).to eq(10)
    end
  end
end
