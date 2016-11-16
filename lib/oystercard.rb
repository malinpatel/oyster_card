class OysterCard
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1
  attr_accessor :balance, :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
    raise "Cannot top up: £#{MAXIMUM_LIMIT} limit would be exceeded" if balance + value > MAXIMUM_LIMIT
    self.balance += value
  end
 
  def deduct(value)
    self.balance -= value
  end

  def touch_in
    raise "Insufficient funds. You need to top up." if insufficient_funds?
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    in_use
  end

  private
  def insufficient_funds?
    balance < MINIMUM_FARE
  end

end
