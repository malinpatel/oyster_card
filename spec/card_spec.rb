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
end
