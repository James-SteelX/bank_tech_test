require 'account'

describe Account do

  let(:todays_date) { Time.now.strftime("%d/%m/%Y") }

  describe '#display_balance' do
   let(:account) { Account.new(100) }
   it 'displays users current balance' do
     expect(account.display_balance).to eq 100
   end
  end

  describe '#deposit' do
    let(:account) { Account.new }
    it 'allows user to deposit money to account' do
     account.deposit(10)
     expect(account.display_balance).to eq 10
    end

    it 'should update the transaction history' do
      account.deposit(10)
      expect(account.print_statement).to eq [{:date=>todays_date, :credit=>10.0, :debit=>"----", :balance=>10.0}]
    end
  end

  describe '#withdraw' do
    let(:account) { Account.new(10) }
    it 'allows you to withdraw if you have the funds' do
      account.withdraw(10)
      expect(account.display_balance).to eq 0
    end

    it 'wont allow you to withdraw if you dont have the funds' do
      expect{ account.withdraw(20) }.to raise_error 'Insufficent funds'
      expect(account.display_balance).to eq 10
    end

    it 'should update the transaction history' do
      account.withdraw(10)
      expect(account.print_statement).to eq [{:date=>todays_date, :credit=>"----", :debit=>10.0, :balance=>0.0}]
    end
  end

  describe '#show_statement' do
    let(:account) { Account.new(10) }
    it 'displays your tansaction history' do
      account.withdraw(10)
      account.deposit(10)
      expect(account.print_statement).to eq [{:date=>todays_date, :credit=>"----", :debit=>10.0, :balance=>0.0}, {:date=>todays_date, :credit=>10.0, :debit=>"----", :balance=>10.0}]
    end
  end

end
