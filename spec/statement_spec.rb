require 'statement'

describe Statement do
  let(:transaction) { [{:date=>todays_date, :credit=>10.0, :debit=>"----", :balance=>10.0}] }
  let(:statement) { Statement.new }
  let(:todays_date) { Time.now.strftime("%d/%m/%Y") }

   describe '#print_statement' do
     it 'takes a list of transactions and returns them formatted' do
       expect(statement.print_statement(transaction)).to eq [{:date=> todays_date, :credit=>10.0, :debit=>"----", :balance=>10.0}]
     end
   end
end
