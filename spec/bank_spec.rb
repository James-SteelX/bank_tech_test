require 'bank'

describe Bank do

  let(:todays_date) { Time.now.strftime("%d/%m/%Y") }
  
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

    it 'should update the transaction history' do
      bank.deposit(10)
      expect(bank.show_statement).to eq [{:date=>todays_date, :credit=>10.0, :debit=>"----", :balance=>10.0}]
    end
  end

  describe '#withdraw' do
    let(:bank) { Bank.new(10) }
    it 'allows you to withdraw if you have the funds' do
      bank.withdraw(10)
      expect(bank.display_balance).to eq 0
    end

    it 'wont allow you to withdraw if you dont have the funds' do
      expect{ bank.withdraw(20) }.to raise_error 'Insufficent funds'
      expect(bank.display_balance).to eq 10
    end

    it 'should update the transaction history' do
      bank.withdraw(10)
      expect(bank.show_statement).to eq [{:date=>todays_date, :credit=>"----", :debit=>10.0, :balance=>0.0}]
    end
  end

  describe '#show_statement' do
    let(:bank) { Bank.new(10) }
    it 'displays your tansaction history' do
      bank.withdraw(10)
      bank.deposit(10)
      expect(bank.show_statement).to eq [{:date=>todays_date, :credit=>"----", :debit=>10.0, :balance=>0.0}, {:date=>todays_date, :credit=>10.0, :debit=>"----", :balance=>10.0}]
    end
  end
end
