
class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journey_history

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
  end

  def top_up(amount)
    raise "You have exceeded the maximum balance of #{MAXIMUM_BALANCE}" if limit_reached?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Sorry you have insufficient funds" if balance_less_than_minimum_fare?(balance)
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    @journey_history << create_journey
    @entry_station = nil
    station
  end

  def create_journey
    {:entry_station => entry_station, :exit_station => exit_station}
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
