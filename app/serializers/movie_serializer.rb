class MovieSerializer
  include FastJsonapi::ObjectSerializer
  include ActionView::Helpers::NumberHelper
  set_type :movie
  set_id :id
  attributes :imbd_id, :title, :release_date, :genres

  attribute :budget do |record|
    "$#{record.budget}"
  end
end
