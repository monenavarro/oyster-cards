require './lib/Oystercard'

class Journey

  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station, :PENALTY_FARE

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end
  
  def finish_journey(station)
    @exit_station = station
    @entry_station = nil
  end

  def fare 
    p @entry_station
    if @entry_station != nil 
      PENALTY_FARE
    else
      Oystercard::MINIMUM_FARE
    end
  end
end