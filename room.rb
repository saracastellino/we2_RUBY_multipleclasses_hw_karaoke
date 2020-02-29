class Room

attr_reader :name, :capacity, :playlist, :till, :entry_fee, :number_of_guests

 def initialize(name, capacity, playlist, till, entry_fee, number_of_guests)
   @name = name
   @capacity = capacity
   @playlist = playlist
   @till = till
   @entry_fee = entry_fee
   @number_of_guests = number_of_guests
 end

  def change_capacity
    @capacity -= number_of_guests.size
  end

  def check_in_guest(guests)
    @number_of_guests.push(guests)
    # return @room.change_capacity
  end

# 	def increase_till(entry_fee)
# 		@tiill += entry_fee
# 	end
end
