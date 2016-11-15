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

      it "deducts minimum fare from balance" do
        minimum_fare = Oystercard::MINIMUM_FARE
        expect {oyster_card.touch_out}.to change{oyster_card.balance}.by(-minimum_fare)
      end
  end

  describe "touching out" do
      it 'checks if a card can be touched out' do
        expect(oyster_card.touch_out).to eq false
      end

      context "sufficient funds on the card" do
        before do
          oyster_card.top_up(Oystercard::MAXIMUM_BALANCE)
        end

    describe "touching in" do
      it 'checks if a card can be touched in' do
        expect(oyster_card.touch_in).to eq true
      end
    end

    describe "in journey?" do
      it 'checks if a card is in journey' do
        oyster_card.touch_out
        expect(oyster_card.in_journey?).to eq false
      end

      it 'checks card is in journey when touched in' do
        oyster_card.touch_in
        expect(oyster_card.in_journey?).to eq true
      end
    end
  end
end

  describe "minimum touch in balance" do

    it "should raise error if balance is below minimum balance" do
      minimum_fare = Oystercard::MINIMUM_FARE - 1
      oyster_card.top_up(minimum_fare)
      expect{oyster_card.touch_in}.to raise_error "Sorry you have insufficient funds"
    end
  end
end
