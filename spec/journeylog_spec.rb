require 'journeylog'
require 'journey'

describe JourneyLog do
  let(:entry_station_jl) {double 'entry station for journey log'}
  let(:exit_station_jl) {double 'exit station for journey log'}
  context '#initialising_class' do
    it 'is initialised with Journey class item ' do
      journey = Journey.new 
     expect(subject.journey_class).to be_an_instance_of Journey
    end    
  end

  context '#starting_journey' do
    it 'start a journey' do
      journey_log = JourneyLog.new(journey_class = Journey.new(entry_station_jl))
      expect(journey_log.entry_station).to eq entry_station_jl
    end
  end

    it 'returns an incomplete journey' do
      journey_log = JourneyLog.new(journey_class = Journey.new(entry_station_jl))
      expect(journey_log.current_journey).to eq journey_class
    end

    it 'should add an exit station to current_journey' do
      journey_log = JourneyLog.new(journey_class = Journey.new(entry_station_jl))
      journey_log.finish(exit_station_jl)
      expect(journey_log.exit_station).to eq exit_station_jl
    end
end