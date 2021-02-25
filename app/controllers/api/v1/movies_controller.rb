class Api::V1::MoviesController < ApplicationController
  def index
    movies = Movie.limit(50).offset(params[:page])
    render json: MovieSerializer.new(movies)
  end

  def show
    render json: MovieDetailsSerializer.new(Movie.find(params[:id]))
  end
end
