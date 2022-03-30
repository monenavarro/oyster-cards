class Oystercard

  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance
  attr_reader :in_journey
  
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Max balance reached!" if amount + balance > MAX_BALANCE
    @balance += amount
    "Your balance is £#{@balance}"
  end
  
  
  def touch_in
    fail 'Insufficient funds to touch in' if balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MINIMUM_FARE) 
  end

  def in_journey?
    @in_journey
  end
private
  def deduct(amount)
    @balance -= amount
    "Your balance is £#{@balance}"
  end  


end