class Api::V1::Movies::SearchController < ApplicationController
  def index
    movies = search(params).limit(50).offset(page(params)*50)
    render json: MovieSerializer.new(movies)
  end

  private

  def search(params)
    Movie.filter(params.slice(:release_date))
  end

  def page(params)
    if params[:page]
      params[:page].to_i - 1
    else
      0
    end
  end
end
