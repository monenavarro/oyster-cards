require './lib/Journey.rb'

describe Journey do
  let(:station) { double "entry_station"}
  let(:exit_station) {double "exit station"}
  
  
  it "starts a journey" do
  journey = Journey.new(station)
  expect(journey.entry_station).to eq station
  end

  context '#finish_journey' do

    it {is_expected.to respond_to(:finish_journey)}
    it 'lets you finish your journey at a station' do
      subject.finish_journey(exit_station)
      expect(subject.exit_station).to eq exit_station
    end
  end
end