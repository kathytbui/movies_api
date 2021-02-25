class Movie < ApplicationRecord
  has_many :ratings

  def average_rating
    sum = self.ratings.sum do |rating|
      rating.rating
    end

    sum/self.ratings.count
  end
end
