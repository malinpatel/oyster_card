class OysterCard
  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1
  attr_accessor :journey_log, :balance, :entry_station

  def initialize
    @balance = 0
    @journey_log = []
  end

  def top_up(value)
    raise "Cannot top up: £#{MAXIMUM_LIMIT} limit would be exceeded" if balance + value > MAXIMUM_LIMIT
    self.balance += value
  end



  def touch_in(station)
    raise "Insufficient funds. You need to top up." if insufficient_funds?
    @entry_station = station
  end

  def touch_out(station)
    deduct MINIMUM_FARE
    self.journey_log << {entry_station => station}
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

end
