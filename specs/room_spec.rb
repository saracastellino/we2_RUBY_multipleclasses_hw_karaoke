require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use!
Minitest::Reporters::SpecReporter.new

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
    @punk_room = Room.new("Punk Room", 10, [@song1, @song2, @song3], 500.00, 5.50, [@guest1])
    @rnr_room = Room.new("Rnr Room", 7, [@song4, @song5, @song6], 500.00, 5.50, [@guest4, @guest5, @guest6])
  end

 # def initialize(name, capacity, playlist, till, entry_fee, number_of_guests)
  def test_get_room_name
    assert_equal("Punk Room", @punk_room.name)
  end
#
  def test_number_of_guests
    assert_equal(1, @punk_room.number_of_guests.size)
  end
#
  def test_decrease_capacity
    @punk_room = Room.new("Punk Room", 10, [@song1, @song2, @song3], 500.00, 5.50, [@guest1, @guest2, @guest4, @guest5])
    result = @punk_room.change_capacity
    assert_equal(6, result)
  end
# #
  def test_increase_capacity
    @punk_room = Room.new("Punk Room", 10, [@song1, @song2, @song3], 500.00, 5.50, [@guest1, @guest2])
    result = @punk_room.change_capacity
    assert_equal(8, result)
  end
#
def test_check_in_guest(guest)
  @rnr_room.check_in_guest(@guest1, @guest2)
  @rnr_room.change_capacity
  assert_equal(5, @rnr_room.number_of_guests)
  assert_equal(2, @rnr_room.capacity)
end
#
# ===test_check_out_guest REMOVE
# 	increase_capacity
#
# ===test_add_1#song_to_playlist ADD
#
# 	def add_song(song)
#     		@playlist << song
#   	end
#
# ===test_deny_access_if_room_full
#
# ===test increase_till
# 	pay_entry_fee
#
#


end
