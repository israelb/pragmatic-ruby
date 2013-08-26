=begin
File.open("movies.csv") do |file|
  #read movies
  file.each_line do |line|
    puts line
  end
end


File.readlines("movies.csv").each do |line| 
  title, rank = line.split(',')
  movie = Movie.new(title, rank.to_i)
  puts movie
end

=end

require_relative 'movie'

File.open("movie_rankings.csv", "w") do |file|
  movies.sort.ech do |movie|
    file.puts "#{movie.title}, #{movie.rank}"
  end
end