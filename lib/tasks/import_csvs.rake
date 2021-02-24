require 'csv'

desc 'Import data from csv files'
task :import => [:environment] do

  puts 'Clearing database...'
  Movie.destroy_all
  Rating.destroy_all

  puts 'Importing movies...'
  CSV.foreach('./db/data/movies.csv', headers: true, header_converters: :symbol) do |row|
    Movie.create!({
        id: row[:movie_id],
        imbd_id: row[:imbd_id],
        title: row[:title],
        overview: row[:overview],
        production_companies: row[:production_companies],
        release_date: row[:release_date],
        budget: row[:budget],
        revenue: row[:revenue],
        runtime: row[:runtime],
        language: row[:language],
        genres: row[:genres],
        status: row[:status]
      }
    )
  end
  puts "#{Movie.count} Movies created"

  puts 'Importing ratings...'
  CSV.foreach('./db/data/ratings.csv', headers: true, header_converters: :symbol) do |row|
    Rating.create!({
        id: row[:rating_id],
        user_id: row[:user_id],
        movie_id: row[:movie_id],
        rating: row[:rating]
      }
    )
  end
  puts "#{Rating.count} Ratings created"

  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end

  puts "CSV successfully imported into database"
end
