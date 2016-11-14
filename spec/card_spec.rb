require 'card.rb'

describe Card do

  subject(:card) { described_class.new }


  context "#balance" do

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

end
