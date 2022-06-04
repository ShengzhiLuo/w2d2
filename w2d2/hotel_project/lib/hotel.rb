require_relative "room"

class Hotel
    def initialize(name,hash)
        @name = "hilbert's grand hotel"
        @rooms = {}
        hash.each do |room_name,capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end
    def name 
        @name.split(" ").map {|word| word.capitalize}.join(" ")
    end
    def rooms
        @rooms
    end
    def room_exists?(room_name)
        self.rooms.has_key?(room_name)
    end
    def check_in(person,room_name)
        if !self.room_exists?(room_name)
            puts "sorry, room does not exist"
        elsif 
            @rooms[room_name].add_occupant(person)
            puts "check in successful"
        else
            puts "should print 'sorry, room is full"
        end
    end
    def has_vacancy?
        @rooms.any?{|room_name,capacity| !@rooms[room_name].full?}
    end
    def list_rooms
        @rooms.each { |name, room| puts "#{name} : #{room.available_space}" }
    end
end
