require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

require_relative("../song.rb")
require_relative("../room.rb")
require_relative("../guest.rb")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Winterpeg", "Hard core")
    @song2 = Song.new("Ruby Soho", "Ska punk")
    @song3 = Song.new("Linoleum", "Punk")
    @song4 = Song.new("Someday never comes", "Rock and Roll")
    @song5 = Song.new("Whole lotta love", "Hard rock")
    @song6 = Song.new("Rainbow", "Classic rock")
  end

  def test_song_genre
    assert_equal("Punk", @song3.genre)
  end

end
