require 'card.rb'

describe Card do

  subject(:card) { described_class.new }

  context "#balance" do

    it "should return card balance as 0 for new card" do
      expect(card.balance).to eq 0
    end

  end

end
