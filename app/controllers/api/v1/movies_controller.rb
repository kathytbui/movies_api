class Api::V1::MoviesController < ApplicationController
  def index
    movies = Movie.limit(50).offset(params[:page])
    render json: MovieSerializer.new(movies)
  end
end
