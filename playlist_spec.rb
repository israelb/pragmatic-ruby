require_relative 'playlist'

describe Playlist do
  before do
    @playlist = Playlist.new("Kermit")
  end

  context "being played with one movie" do
    before do
      @initial_rank = 10
      @movie = Movie.new("goonies", @initial_rank)
      @playlist.add_movie(@movie)
    end

    it "gives the movie a thumbs up if  a hight number is rolled" do
      WaldorfAndStatler.stub(:roll_die).and_return(5)
      @playlist.play #(5)

      @movie.rank.should == @initial_rank + 1
    end
    
    it "skips the movie if a medium number is rolled" do
      WaldorfAndStatler.stub(:roll_die).and_return(3)
      @playlist.play #(3)

      @movie.rank.should == @initial_rank
    end

    it "gives the movie a thumbs down if  a low number is rolled" do
      WaldorfAndStatler.stub(:roll_die).and_return(1)
      @playlist.play #(1)

      @movie.rank.should == @initial_rank - 1
    end
    
  end

end