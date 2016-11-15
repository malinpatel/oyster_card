require "station"

describe Station do

subject(:station) {described_class.new( "Kings Cross", 1)}

  describe "a new station" do

  it "a new station exposes a name variable" do
    expect(station.name).to eq "Kings Cross"
  end

  it "a new station exposes a zone" do

    expect(station.zone).to eq 1
  end


end


end
