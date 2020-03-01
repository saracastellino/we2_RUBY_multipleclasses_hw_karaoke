class Room

attr_reader :name, :available_places, :playlist, :till, :entry_fee, :guests

 def initialize(name, available_places, playlist, till, entry_fee, guests)
   @name = name
   @available_places = available_places
   @playlist = playlist
   @till = till
   @entry_fee = entry_fee
   @guests = guests
 end

  def change_available_places
    @available_places -= @guests.size
  end

  def increase_till(entry_fee)
  	@till += @entry_fee
  end

  def check_in_guest(*guest)
    @guests.push(*guest)
    # @room.change_available_places
    # @room.increase_till(entry_fee)
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end

	def add_song_to_playlist(song)
		new_playlist = @playlist << song
    return new_playlist.map {|song| song.name}
	end

 def deny_access(*guest)
   check_in_guest(*guest) if @available_places > 0 && guests.wallet >= 5.50
 end

 def fav_song_on_air(guest)
  fav_song_found = @playlist.find {|song| song == guest.fav_song}
  return fav_song_found == guest.fav_song ? "Yay!!! Give me the mic NOW!!!" : "Cool!"
 end

end
