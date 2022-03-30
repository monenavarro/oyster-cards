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

   it 'deducts an amount from the balance' do
     subject.top_up(50)
     expect{ subject.deduct 1 }.to change {subject.balance}.by -1 
   end

   describe "#touch_in" do
     it 'should be able to touch in' do
     subject.touch_in
     expect(subject.in_journey?).to eq true
     end
    end

     
     describe "#touch_out" do
      it 'should be able to touch out' do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey?).to eq false
      end
    end
     
      describe "#in_a_journey" do
      it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
      end
    end

end
   