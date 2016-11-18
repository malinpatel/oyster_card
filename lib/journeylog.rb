require_relative 'journey'

class JourneyLog

  attr_reader :journey_class

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    journey_new = journey_class.new
    journey_new.begin(station)
    @journeys << journey_new

  end

  def finish(station2)
    @journeys.last.terminate(station2)
  end

  def journeys
    @journeys.dup
  end



end
