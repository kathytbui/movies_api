class Movie < ApplicationRecord
  include Filterable
  has_many :ratings

  scope :filter_by_release_date, ->(release_date) { where('extract(year from release_date) = ?', release_date.to_i).order(:release_date) }
  scope :filter_by_genres, ->(genres) { where('lower(genres) like ?', "%#{genres.downcase}%") }

  def average_rating
    sum = self.ratings.sum do |rating|
      rating.rating
    end

    sum/self.ratings.count
  end
end
