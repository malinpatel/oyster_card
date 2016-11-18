class Journey

  attr_reader :trip, :fare

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @trip= {}
  end

  def in_journey?
    @current_journey[:origin] != nil
  end

  def begin(station)
    trip[:entry_station] = station
  end

  def terminate(station)
    trip[:exit_station] = station
  end

  def fare
    return PENALTY_FARE if incomplete?
    return MINIMUM_FARE
  end

  def incomplete?
    trip[:entry_station] == nil || trip[:exit_station] == nil
  end

  private

    attr_writer :trip

end
