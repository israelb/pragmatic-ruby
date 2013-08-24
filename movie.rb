class Movie
  attr_reader :rank
  attr_accessor :title

  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
  end

  def hit?
    @rank >= 10
  end

  def status
    hit? ? "Hit" : "Flop"
  end

  def normalized_rank
    @rank / 10
  end 

  def thumbs_up
    @rank += 1
  end

  def thumbs_down
    @rank -= 1
  end


  def to_s
    "#{@title} has a rank of #{rank} (#{status})"
  end
end

# Only run the following code when this file is the main file being run
# instead of having been required or loaded by another file.
# IF the file is being executed directly, i.e., as a script.
if __FILE__ == $0
  movie = Movie.new("Capulina y el santo", 6)
  puts movie.title
  puts movie.rank
end