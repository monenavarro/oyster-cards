class Oystercard

  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :entry_station, :balance
  
  def initialize
    @balance = 0
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

  def touch_out
    deduct(MINIMUM_FARE) 
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end
private
  def deduct(amount)
    @balance -= amount
    "Your balance is £#{@balance}"
  end  


end