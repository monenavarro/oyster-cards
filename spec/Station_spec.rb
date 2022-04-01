require 'Station'

describe Station do
  subject { described_class.new("Paddington", 1) }

  describe "#name" do
    it "logs the name of the station" do
      expect(subject.name).to eq ("Paddington")
    end
  end

  describe "#zone" do
    it "logs the zone of the station" do 
      expect(subject.zone).to eq (1)
    end
  end
end




