class MovieSerializer
  include FastJsonapi::ObjectSerializer
  set_type :ratings
  set_id :id
  attributes :User_id, :movie_id, :rating
end
