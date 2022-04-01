require './lib/Journey'
require './lib/Oystercard'

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

    it 'calculates a fare' do 
      journey = Journey.new(station)
      journey.finish_journey(exit_station)
      expect(journey.fare).to eq Oystercard::MINIMUM_FARE
    end

    it 'calculates a penalty' do
      journey = Journey.new(station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
  end
end