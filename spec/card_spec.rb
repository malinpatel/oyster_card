require 'card.rb'

describe Card do

  subject(:card) { described_class.new }

  context "#balance" do
    it "should return card balance as 0 for new card" do
      expect(card.balance).to eq 0
    end

    it "checks that the card can be topped up" do
      amount = 10
      expect(card.top_up(amount)).to eq("Top up successful")
    end

    it 'checks the top up amount is added to the balance' do
      amount = 10
      card.top_up(amount)
      expect(card.balance).to eq(10)
    end

  end

end
