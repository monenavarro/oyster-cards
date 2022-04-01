require_relative '../lib/journey.rb'

class JourneyLog
    attr_reader :journey_class, :entry_station, :exit_station
    
    def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @entry_station = @journey_class.entry_station
    @exit_station = nil
    end
    
    def start_journey(station)
        @entry_station = station
        @exit_station = nil 
    end

    def finish(station)
      @exit_station = station
      @entry_station = nil
    end

    def current_journey
      if @entry_station != nil
        @journey_class
      else
        @journey_class = Journey.new()
      end
    end

end