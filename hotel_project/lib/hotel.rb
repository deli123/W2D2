require_relative "room"

class Hotel
    attr_reader :rooms

    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each do |room, capacity|
            @rooms[room] = Room.new(capacity)
        end
    end

    def name
        @name.split(" ").map {|word| word.capitalize}.join(" ")
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
                if @rooms[room_name].add_occupant(person)
                    print "Check in successful"
                else
                    print "Sorry, room is full"
                end
        else
            print "Sorry, room does not exist"
        end            
    end

    def has_vacancy?
        @rooms.keys.any? { |room_name| !@rooms[room_name].full? }
    end

    def list_rooms
        @rooms.each_key do |room_name|
            puts room_name + ": " + @rooms[room_name].available_space.to_s
        end
    end
end
