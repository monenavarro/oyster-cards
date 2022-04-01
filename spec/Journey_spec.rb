require './lib/Journey.rb'

describe Journey do
  let(:station) { double "entry_station"}
  it "starts a journey" do
  journey = Journey.new(station)
  expect(journey.entry_station).to eq station
  end
end