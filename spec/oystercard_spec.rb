require 'oystercard'

describe OysterCard do
  subject(:oystercard) {described_class.new}

  it { is_expected.to respond_to(:balance) }
  it { is_expected.to respond_to(:top_up).with(1).argument }
  it "should increase the balance by top_up value" do
    oystercard.top_up(10)
    expect(oystercard.balance).to eq 10
  end

end
