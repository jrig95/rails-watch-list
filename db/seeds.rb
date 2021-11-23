require "json"
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
puts ' All Destroyed'
# 5.times do
#   list = List.create!(
#     name: Faker::Company.name
#   )

  url = "http://tmdb.lewagon.com/movie/top_rated"
  read_movies = URI.open(url).read
  top_movies = JSON.parse(read_movies)
  search_result = top_movies["results"]

  search_result.each do |movie|
    Movie.create!(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: "https://image.tmdb.org/t/p/w500/#{movie["poster_path"]}",
      rating: movie["vote_average"]
    )
  end
  # movie = Movie.create!(
  #   title: Faker::Movie.title,
  #   overview:  Faker::Movie.quote,
  #   poster_url: Faker::Internet.url,
  #   rating: Faker::Number.between(from: 1.0, to: 10.0)
  # )
#   Bookmark.create!(
#     comment: 'Greaaaaattttt!',
#     list: list,
#     movie: movie
#   )
#   puts "created bookmark"
# end

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
