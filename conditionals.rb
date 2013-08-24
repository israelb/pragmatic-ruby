require_relative 'movie'

movie = Movie.new("goodfather", 10)

if movie.rank >= 10
  puts "Hit"
else
  puts "Flop"
end
    