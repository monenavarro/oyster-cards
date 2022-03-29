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
end