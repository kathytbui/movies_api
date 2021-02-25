class MovieSerializer
  include FastJsonapi::ObjectSerializer
  set_type :movie
  set_id :id
  attributes :imdb_id, :title, :release_date, :genres

  attribute :budget do |record|
    "$#{record.budget}"
  end
end
