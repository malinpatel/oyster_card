require 'oystercard'

describe OysterCard do
  subject(:oystercard) {described_class.new}

  it { is_expected.to respond_to(:balance) }
end
