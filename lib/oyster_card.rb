
class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "You have exceeded the maximum balance of #{MAXIMUM_BALANCE}" if limit_reached(amount)
    @balance += amount
  end

  def limit_reached(amount)
    amount > MAXIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

end
