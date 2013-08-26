class Movie
  attr_reader :rank
  attr_accessor :title

  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
    @snack_carbs = Hash.new(0)
  end

  # Vamos recorriendo el hash y enviando los valores con yield a donde se invoco.
  def each_snack
    @snack_carbs.each do |name, carbs|
      snack = Snack.new(name, carbs)
      yield snack
    end
  end

  def carbs_consumed
    @snack_carbs.values.reduce(0, :+)
  end

  def ate_snack(snack)
    @snack_carbs[snack.name] += snack.carbs
    puts "#{@title} led to #{snack.carbs} #{snack.name} #{snack.name}"
    puts "#{@title}'s snacks: #{@snack_carbs}"
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

  # sort method
  def <=>(other_movie)
    other_movie.rank <=> @rank
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