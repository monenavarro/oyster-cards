class Oystercard

  MAX_BALANCE = 90

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
  
  def deduct(amount)
    @balance -= amount
    "Your balance is £#{@balance}"
  end  

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end