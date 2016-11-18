require 'journeylog'
require 'journey'

describe JourneyLog do

  subject (:journeylog) {described_class.new(Journey)}


  it 'should create a new object' do
    expect(journeylog).to be_a(Object)
  end

  describe '#start' do
    it 'should respond to start' do
      expect(journeylog).to respond_to(:start)
    end

    it 'should take an entry_station as an argument' do
      expect(journeylog).to respond_to(:start).with(1).argument
    end

  end

  describe '#finish' do
    it 'should respond to finish' do
      expect(journeylog).to respond_to(:finish).with(1).argument
    end
  end

end
