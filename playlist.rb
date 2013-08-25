require_relative 'movie'
require_relative 'waldorf_and_statler'
require_relative 'snak_bar'
require "colorize"

class Playlist
  def initialize(name)
    @name = name
    @movies = []
    @config = {space: 50, symbol: '*'}
  end

  def add_movie(movie)
    @movies << movie
  end

  def play(viewings)
    puts "#{@name}'s playlist:".center(@config[:space], @config[:symbol]).colorize( color: :white, :background => :red  )
    puts @movies.sort

    snacks = SnackBar::SNACKS
    puts "\nThere are #{snacks.size} snacks available in the snack bar"

    snacks.each do |snack|
      puts "#{snack.name} has #{snack.carbs} carbs"
    end

    1.upto(viewings) do |count|
      puts "\n" + "Viewing #{count}".center(@config[:space], @config[:symbol]).colorize(:blue)
      @movies.each do |movie|
        WaldorfAndStatler.review(movie)
        snack = SnackBar.random
        movie.ate_snack(snack)
        puts movie
      end
    end
  end

  def total_carbs_consumed
    @movies.reduce(0) do |sum, movie|
      sum + movie.carbs_consumed
    end
  end

  def print_stats
    puts "\n" + "#{@name}'s' Stats".center(@config[:space], @config[:symbol]).colorize(:blue)
    
    puts "#{total_carbs_consumed} total carbs consumed"
    @movies.sort.each do |movie|
      puts "\n#{movie.title}'s snack totals:"
      puts "#{movie.carbs_consumed} grand total carbs"
    end

    hits, flops = @movies.partition { |movie| movie.hit? }

    puts "\nHits:".colorize(:red)
    puts hits.sort

    puts "\nFlops:".colorize(:red)
    puts flops.sort

  end


end