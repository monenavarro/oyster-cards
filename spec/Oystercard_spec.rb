require_relative '../lib/Oystercard.rb'

describe Oystercard do

  it "has a balance when created" do
    expect(subject.balance).to eq 0
  end

  it "can have the balance topped up" do
    expect(subject.top_up(5)).to eq "Your balance is £5"
  end

  it "raises an error if max balance exceeded" do
    max_balance = Oystercard::MAX_BALANCE
    subject.top_up(max_balance)
    expect{ subject.top_up (1) }.to raise_error "Max balance reached!"
  end

   describe "#touch_in" do
   let(:station) {double :station}
     it 'should be able to touch in' do
     subject.top_up(5)
     subject.touch_in(station)
     expect(subject).to be_in_journey
     end

     it "raise error if card has insufficient funds" do
      expect{subject.touch_in(station)}.to raise_error "Insufficient funds to touch in"
     end

     it "logs entry station history" do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject).to have_attributes(:entry_station => station)
     end

    end

     
     describe "#touch_out" do
     let(:station) {double :station}
      it 'should be able to touch out' do
      subject.top_up(5)
      subject.touch_in(station)
      subject.touch_out(station)
      expect(subject).not_to be_in_journey
      end

      it 'deduct from the balance when touch out' do
        subject.top_up(5)
        subject.touch_in(station)
        expect{ subject.touch_out(station) }.to change {subject.balance}.by (-1)
      end

      it "logs exit station history" do
        subject.top_up(5)
        subject.touch_in(station)
        subject.touch_out(station)
        expect(subject).to have_attributes(:exit_station => nil)
      end
    end

      describe "#in_a_journey" do
      it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
      end
    end

      describe '#list_of_journeys' do
        let (:station) { double :station }
        it '#list_of_journeys is empty upon card creation ' do
          expect(subject.list_of_journeys).to be_empty
        end

        it 'Stores the history of a journey' do
          subject.top_up(50)
          subject.touch_in(station)
          subject.touch_out(station)
          expect(subject.list_of_journeys).to eq ([{station => station}])
        end
      end

end
   