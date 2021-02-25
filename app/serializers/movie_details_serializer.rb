class MovieDetailsSerializer
  include FastJsonapi::ObjectSerializer
  set_type :movie
  set_id :id
  attributes :imdb_id, :title, :release_date, :budget, :runtime, :genres, :production_companies

  attribute :budget do |record|
    "$#{record.budget}"
  end

  attribute :average_rating do |record|
    if !record.ratings.empty?
      record.average_rating
    else
      'No rating'
    end
  end

  attribute :description do |record|
    record.overview
  end

  attribute :original_language do |record|
    record.language
  end

  has_many :ratings, if: Proc.new { |record| record.ratings.any? }
end
