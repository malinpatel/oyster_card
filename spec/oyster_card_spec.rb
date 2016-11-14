require 'oyster_card'

describe Oystercard do

  subject(:oyster_card) {described_class.new}

  it "check oyster card responds to a method balance?" do
    expect(oyster_card).to respond_to (:balance)
  end

  it "oyster card has an initial balance of zero" do
    expect(oyster_card.balance).to eq 0
  end

  it "check oyster card can be topped up" do
    expect(oyster_card).to respond_to(:top_up).with(1).argument
  end

  it "topping up increases the balance of the oyster card" do
    oyster_card.top_up(10)
    expect(oyster_card.balance).to eq 10
  end

end
