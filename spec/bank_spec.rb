require 'bank'

describe Bank do

  describe '#display_balance' do
   let(:bank) { Bank.new(100) }
   it 'displays users current balance' do
     expect(bank.display_balance).to eq 100
   end
  end

  describe '#deposit' do
    let(:bank) { Bank.new }
    it 'allows user to deposit money to bank' do
     bank.deposit(10)
     expect(bank.display_balance).to eq 10
    end
  end
end
