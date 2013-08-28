require_relative 'playlist'
require_relative 'movie3d'

playlist = Flicks::Playlist.new("Kermit")

# ARGV.shift   Pasa un nuevo parametro desde la terminal
playlist.load(ARGV.shift || "movies.csv")

movie3d = Movie3D.new("Glee", 5, 20)
playlist.add_movie(movie3d)


loop do
  puts "\nHow many viewings? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
    when /^\d+$/
      playlist.play(answer.to_i)
    when 'quit', 'exit'
      playlist.print_stats
      break
    else
      puts "Please enter a number or 'quit'"
  end
end

playlist.save