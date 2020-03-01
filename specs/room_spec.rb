require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use!
Minitest::Reporters::SpecReporter.new
require('pry')
require_relative("../room.rb")
require_relative("../song.rb")
require_relative("../guest.rb")

class RoomTest < MiniTest::Test

  def setup
    @song1 = Song.new("Winterpeg", "Hard core")
    @song2 = Song.new("Ruby Soho", "Ska punk")
    @song3 = Song.new("Linoleum", "Punk")
    @song4 = Song.new("Someday never comes", "Rock and Roll")
    @song5 = Song.new("Whole lotta love", "Hard rock")
    @song6 = Song.new("Rainbow", "Classic rock")

    @punk_room = Room.new("Punk Room", 7, [@song1, @song2, @song3], 500.00, 5.50, [@guest1])
    @rnr_room = Room.new("Rnr Room", 6, [@song4, @song5, @song6], 500.00, 5.50, [@guest4, @guest5, @guest6])

    @guest2 = Guest.new("Louise", 80.00, @song5)
    @guest3 = Guest.new("Mary", 60.00, @song2)
    @guest5 = Guest.new("Nick", 65.00, @song5)
    @guest7 = Guest.new("Nick", 65.00, @song5)
    @guest8 = Guest.new("Joseph", 40.00, @song2)
  end

  def test_get_room_name
    assert_equal("Punk Room", @punk_room.name)
  end

  def test_number_of_guests
    assert_equal(1, @punk_room.guests.size)
  end

  def test_change_available_places
    assert_equal(3, @rnr_room.change_available_places)
  end

  def test_increase_till
    @rnr_room.increase_till(@entry_fee)
    assert_equal(505.50, @rnr_room.till)
  end

  def test_check_in_guest
    result = @punk_room.check_in_guest(@guest2)
    @punk_room.increase_till(@entry_fee)
    @punk_room.change_available_places
    assert_equal(505.50, @punk_room.till)
    assert_equal(2, result.length)
    assert_equal(5, @punk_room.capacity)
  end

  def test_check_out_guest
    result = @punk_room.check_out_guest(@guest1)
    result = @punk_room.change_available_places
    assert_nil(nil, result)
    assert_equal(7, result)
  end

  def test_add_song_to_playlist
    expected_songs = ["Someday never comes", "Whole lotta love", "Rainbow", "Ruby Soho"]
    result = @rnr_room.add_song_to_playlist(@song2)
    assert_equal(expected_songs, result)
  end

  def test_deny_access_available_seats
    @guest8 = Guest.new("Joseph", 40.00, @song2)
    @rnr_room = Room.new("Rnr Room", 6, [@song4, @song5, @song6], 500.00, 5.50, [@guest2, @guest3, @guest4, @guest5, @guest6, @guest7])
    result = @rnr_room.deny_access_available_seats(@guest8)
    assert_nil(nil,result)
  end

  def test_deny_access_guest_can_afford_fee
    @guest1 = Guest.new("John", 5.00, @song2)
    @punk_room = Room.new("Punk Room", 7, [@song1, @song2, @song3], 500.00, 5.50, [@guest4])
    result = @rnr_room.deny_access_guest_can_afford_fee(@guest1, @entry_fee)
    assert_nil(nil, result)
  end

  def test_fav_song_on_air
   result = @rnr_room.fav_song_on_air(@guest5)
   assert_equal("Yay!!! Give me the mic NOW!!!", result)
  end

end
