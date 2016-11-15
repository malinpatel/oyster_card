
class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :in_use

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    raise "You have exceeded the maximum balance of #{MAXIMUM_BALANCE}" if limit_reached?(amount)
    @balance += amount
  end

  def touch_in
    raise "Sorry you have insufficient funds" if balance_less_than_minimum_fare?(balance)
    @in_use = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_use = false
  end

  def in_journey?
    @in_use
  end

  def balance_less_than_minimum_fare?(balance)
    balance < MINIMUM_FARE
  end

  def limit_reached?(amount)
    amount + balance > MAXIMUM_BALANCE
  end

  private

    def deduct(amount)
      @balance -= amount
    end


end
