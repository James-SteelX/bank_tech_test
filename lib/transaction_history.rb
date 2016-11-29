require_relative 'account'

class TransactionHistory

  def initialize
   @transaction_history = []
  end

  def add_to_transaction_history(credit: "----", debit: "----", balance: 0 )
      @transaction_history.push({date: Time.now.strftime("%d/%m/%Y"),
                                 credit: credit,
                                 debit: debit,
                                 balance: balance })
  end

  def transaction_details
   @transaction_history
  end

end
