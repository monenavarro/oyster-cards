class Oystercard

  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :entry_station, :balance, :exit_station, :list_of_journeys
  
  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @list_of_journeys = []
  end

  def top_up(amount)
    fail "Max balance reached!" if amount + balance > MAX_BALANCE
    @balance += amount
    "Your balance is £#{@balance}"
  end
  
  
  def touch_in(station)
    fail 'Insufficient funds to touch in' if balance < MINIMUM_FARE
    @entry_station = station

  end

  def touch_out(station)
    deduct(MINIMUM_FARE) 
    @exit_station = station
    list_of_journeys
    @exit_station = nil
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  def list_of_journeys
    if @entry_station != nil
      @list_of_journeys.push({@entry_station => @exit_station})
    end
    @list_of_journeys
  end

private
  def deduct(amount)
    @balance -= amount
    "Your balance is £#{@balance}"
  end  
end
