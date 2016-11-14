require 'card.rb'

describe Card do

  subject(:card) { described_class.new }


  context "#checking balance" do

    before(:each) do
      @amount = 90
    end

    it "should return card balance as £0 for new card" do
      expect(card.balance).to eq 0
    end

    it "checks that the card can be topped up" do
      expect(card.top_up(@amount)).to eq("Top up of £#{@amount} successful. New balance: £#{card.balance}")
    end

    it 'checks the top up amount is added to the balance' do
      card.top_up(@amount)
      expect(card.balance).to eq(90)
    end

    it 'should not allow user to have more than £90 on the card' do
      maximum_balance =  Card::MAXIMUM_BALANCE
      card.top_up(maximum_balance)
      expect{card.top_up(2)}.to raise_error "Top up failed: maximum balance of £#{maximum_balance} reached"
    end

  end

    context "#spending money" do

      before(:each) do
        card.top_up(50)
        @fare = 10
      end

      it "checks deducts can accept fare" do
        expect(card).to respond_to(:deduct).with(1).argument
      end

      it "should deduct fare from current balance and return balance" do
        expect(card.deduct(@fare)).to eq "New balance: £#{card.balance}."
      end

      it "should deduct fare from current balance" do
        expect{card.deduct(@fare)}.to change{card.balance}.by -@fare
      end
    end


    context "#touching in when card not in journey" do
      before(:each) do
        card.stub(:in_journey?).and_return(false)
      end

      it "checks card can be touched in" do
        expect(card.touch_in).to eq true
      end
    end

      context "#touching in when card is in journey" do
      before(:each) do
        card.stub(:in_journey?).and_return(true)
      end

      it "checks a card can only be touched in once" do
        expect{card.touch_in}.to raise_error "Error: Card already touched in"
      end
    end


    context "#touching out" do

      it "checks card can be touched out" do
        card.stub(:in_journey?).and_return(true)
        expect(card.touch_out).to eq false
      end

      it "checks a card cannot be touched out if card is not in journey" do
        card.stub(:in_journey?).and_return(false)
        expect{card.touch_out}.to raise_error "Error: Card has not been touched in"
      end
    end

    context "#in_journey?" do

      it 'checks card is not in journey it not touched in' do
        expect(card.in_journey?).to eq false
      end

      it "checks if card has been touched in" do
        card.touch_in
        expect(card.in_journey?).to eq true
      end
    end
end
