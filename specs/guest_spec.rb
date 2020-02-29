require("minitest/autorun")
require("minitest/reporters")
MiniTest::Reporters.use!
MiniTest::Reporters::SpecReporter.new
require('pry')

require_relative("../guest.rb")

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("John", 5.00, [@song2, @song4])
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

  # def test_decrease_wallet
  #   @guest5.decrease_wallet(@entry_fee)
  #   assert_equal(59.50, @guest5.wallet)
  # end

end
