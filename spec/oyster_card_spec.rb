require 'oyster_card'

describe Oystercard do

  subject(:oyster_card) {described_class.new}

  describe "Topping up" do

    it "check oyster card can be topped up" do
      expect(oyster_card).to respond_to(:top_up).with(1).argument
    end

    it "topping up increases the balance of the oyster card" do
      oyster_card.top_up(10)
      expect(oyster_card.balance).to eq 10
    end


      it "topping up raises an error if balance exceeds maximum balance" do
        max_balance = Oystercard::MAXIMUM_BALANCE
        expect {oyster_card.top_up(max_balance+1)}.to raise_error ("You have exceeded the maximum balance of #{max_balance}")
      end

  end

  describe "Balance" do

    it "oyster card has an initial balance of zero" do
      expect(oyster_card.balance).to eq 0
    end

  end

  describe "paying" do

    it "oyster_card responds to deduct method" do
      expect(oyster_card).to respond_to (:deduct)
    end
  end

end
