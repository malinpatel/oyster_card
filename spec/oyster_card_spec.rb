require 'oyster_card'

describe Oystercard do

  subject(:oyster_card) {described_class.new}

  it "check oyster card responds to a method balance?" do

    expect(oyster_card).to respond_to (:balance)

  end

end
