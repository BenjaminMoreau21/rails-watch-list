require "json"
require "open-uri"

Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
movies = JSON.parse(user_serialized)["results"]
puts "Starting"
movies.each do |movie|
  Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}", rating: movie["vote_average"])
end
puts "finishing"
