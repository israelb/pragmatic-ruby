require_relative 'rankable'

class Movie
  include Rankable

  attr_accessor :rank
  attr_accessor :title

  def initialize(title, rank=0)
    @title = title.capitalize
    @rank = rank
    @snack_carbs = Hash.new(0)
  end

  def self.from_csv(line)
    # separa la linea que se pasa del csv
    title, rank = line.split(',')
    Movie.new(title, Integer(rank))
  end

  def to_csv
    "#{@title},#{@rank}"
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

  # Snakcs was eating in a movie
  # Params:
  # +snack+:: the snack ate
  def ate_snack(snack)
    @snack_carbs[snack.name] += snack.carbs
    puts "#{@title} led to #{snack.carbs} #{snack.name} #{snack.name}"
    puts "#{@title}'s snacks: #{@snack_carbs}"
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