require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use!
MiniTest::Reporters::SpecReporter.new

require_relative("../guest.rb")
require_relative("../room.rb")
require_relative("../song.rb")

class GuestTest < MiniTest::Test

  def setup
    @rnr_room = Room.new("Rnr Room", 6, [@song4, @song5, @song6], 500.00, 5.50, [@guest4, @guest5, @guest6])
    @guest1 = Guest.new("John", 5.00, @song2)
    @guest2 = Guest.new("Louise", 80.00, @song5)
    @guest3 = Guest.new("Mary", 60.00, @song2)
    @guest4 = Guest.new("Valeria", 50.00, @song3)
    @guest5 = Guest.new("Nick", 65.00, @song5)
    @guest6 = Guest.new("Jospeh", 40.00, @song2)
    @guest7 = Guest.new("Nick", 65.00, @song5)
    @guest8 = Guest.new("Joseph", 40.00, @song2)
  end

  def test_get_guest_wallet
    assert_equal(80, @guest2.wallet)
  end
  #
  def test_decrease_wallet
    @guest5.decrease_wallet(@rnr_room)
    assert_equal(59.50, @guest5.wallet)
  end


end
