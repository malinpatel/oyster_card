class OysterCard
  MAXIMUM_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(value)
    raise "Cannot top up: £#{MAXIMUM_LIMIT} limit would be exceeded" if (limit_exceeded?(value))
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  private
  def limit_exceeded?(value)
    @balance + value > MAXIMUM_LIMIT
  end

end
