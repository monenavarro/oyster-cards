class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end
  
  def finish_journey(station)
    @exit_station = station
    @entry_station = nil
  end
end