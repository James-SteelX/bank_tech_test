require 'transaction_history'

describe TransactionHistory do
  let(:transaction) { [{:date=>todays_date, :credit=>10.0, :debit=>"----", :balance=>10.0}] }
  let(:transaction_history) { TransactionHistory.new }
  let(:todays_date) { Time.now.strftime("%d/%m/%Y") }

  describe '#add_to_transaction_history' do
    it 'adds transaction to transaction_history array' do
      transaction_history.add_to_transaction_history(credit: 10.0, balance: 10.0)
      expect(transaction_history.transaction_details).to eq transaction
    end
  end

  describe '#transaction_details' do
    it 'returns transaction_history array' do
      expect(transaction_history.transaction_details). to eq []
    end
  end
end
