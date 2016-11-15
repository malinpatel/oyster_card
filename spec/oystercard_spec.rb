require 'oystercard'

describe OysterCard do
  subject(:oystercard) {described_class.new}

  context "balance" do
    it { is_expected.to respond_to(:balance) }
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

  describe "#deduct" do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it "should allow to have value deducted" do
      oystercard.top_up(10)
      oystercard.deduct(2)
      expect(oystercard.balance).to eq 8
    end
  end

end
