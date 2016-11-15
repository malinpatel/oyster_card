
class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise "You have exceeded the maximum balance of #{MAXIMUM_BALANCE}" if limit_reached?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Sorry you have insufficient funds" if balance_less_than_minimum_fare?(balance)
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
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
