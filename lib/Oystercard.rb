class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance
  
  def initialize
    @balance = 0
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

end