require_relative 'journey'
require_relative 'journeylog'

class Oystercard

  attr_reader :balance, :journey_log, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize(journey_klass)
    @balance = 0
    @entry_station = nil
    @journey_log = journey_klass.new(Journey)
  end

  def top_up(amount)
    fail "Top up too much. Maximum balance is £90." if makes_card_full?(amount)
    @balance += amount
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.journeys.last.fare)
    @entry_station == nil

  end

  def touch_in(entry_station)
    fail "Pauper" if below_minimum_balance?
    check_previous_journey
    create_journey(entry_station)
    @entry_station  = entry_station

  end

  def makes_card_full?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def below_minimum_balance?
    @balance < MINIMUM_BALANCE
  end


  private

    def deduct(fare)
      @balance -= fare
    end

    def check_previous_journey
      if journey_log.journeys.any? && journey_log.last.incomplete?
        deduct(journey_log.journeys.last.fare)
      end
    end

    def create_journey(entry_station)
      journey_log.start(entry_station)
    end

end
