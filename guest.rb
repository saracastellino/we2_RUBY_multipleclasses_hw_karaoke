class Guest

attr_reader :name, :fav_song
attr_accessor :wallet

 def initialize(name, wallet, fav_song)
  @name = name
  @wallet = wallet
  @fav_song = fav_song
 end

 def decrease_wallet(room)
  @wallet -= room.entry_fee
 end

end
