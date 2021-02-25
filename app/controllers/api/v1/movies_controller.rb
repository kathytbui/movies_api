class Api::V1::MoviesController < ApplicationController
  def index
    movies = Movie.limit(50).offset(page(params)*50)
    render json: MovieSerializer.new(movies)
  end

  def show
    render json: MovieDetailsSerializer.new(Movie.find(params[:id]))
  end

  def page(params)
    if params[:page]
      params[:page].to_i - 1
    else
      0
    end
  end
end
