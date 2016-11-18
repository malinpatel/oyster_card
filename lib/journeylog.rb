require_relative 'journey'

class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    current_journey(entry_station)
  end

  def finish(exit_station)
    @journeys << @journey.current_journey
  end

  private

    def current_journey(entry_station)
      @journey = @journey_class.new if incomplete_journey?
    end

    def incomplete_journey?
      @journeys[-1][:origin] == nil || @journeys[-1][:destination] == nil
    end

end
