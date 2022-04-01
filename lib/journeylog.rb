require 'journey'

class JourneyLog
    attr_reader :journey_class, :entry_station. :exit_station
    
    def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @entry_station = @journey_class.entry_station
    @exit_station = nil
    end
    
    def start_journey 
        @entry_station = @journey_class.entry_station
        @exit_station = nil 
    end

end