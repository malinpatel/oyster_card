require 'oystercard'

describe OysterCard do
  subject(:oystercard) {described_class.new}
  let(:station) {double :station}


  context "balance" do
    it { is_expected.to respond_to(:balance) }
  end

  context "insufficient funds" do
    before do
      oystercard.top_up(0.9)
    end
    it "should raise an error if the balance is less than 1" do
      entry_station = "King's cross"
      expect{ oystercard.touch_in(entry_station) }.to raise_error("Insufficient funds. You need to top up.")
    end

  end

  describe "journey" do
    context "sufficient funds" do
      before do
        oystercard.top_up(10)
        entry_station = "King's cross"
        oystercard.touch_in(entry_station)
      end
      it { is_expected.to respond_to(:touch_in) }
      it { is_expected.to respond_to(:touch_out) }
      it { is_expected.to respond_to(:in_journey?)}
      it 'deducts minimum fare when touched out' do
        station = "King's cross"
        oystercard.touch_in(station)
        expect{oystercard.touch_out(station)}.to change{oystercard.balance}.by(-1)
      end
    end
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it "should increase the balance by top_up value" do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end

      it "should raise an error if max. limit is exceeeded" do
        message = "Cannot top up: £#{OysterCard::MAXIMUM_LIMIT} limit would be exceeded"
        expect {oystercard.top_up(100)}.to raise_error(message)
      end

  end

describe "#touching out" do
  it "stores the exit station" do
    oystercard.top_up(90)
    oystercard.touch_in("Kings Cross")
    oystercard.touch_out("Euston")
    journey = {"Kings Cross" => "Euston"}
    expect(oystercard.journey_log).to include journey
  end
end


end
