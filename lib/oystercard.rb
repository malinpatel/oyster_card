class OysterCard
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1
  attr_accessor :entry_station, :balance

  def initialize
    @balance = 0
    @entry_station = []
  end

  def top_up(value)
    raise "Cannot top up: £#{MAXIMUM_LIMIT} limit would be exceeded" if balance + value > MAXIMUM_LIMIT
    self.balance += value
  end



  def touch_in(station)
    raise "Insufficient funds. You need to top up." if insufficient_funds?
    store_journey(station)
  end

  def touch_out
    deduct MINIMUM_FARE
    self.entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private
  def insufficient_funds?
    balance < MINIMUM_FARE
  end

  def deduct(value)
    self.balance -= value
  end

  def store_journey(station)
    self.entry_station << station
  end

end
