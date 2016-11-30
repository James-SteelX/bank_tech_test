require_relative 'transaction_history'
require_relative 'statement'

class Account

  def initialize(balance = 0)
   @current_balance = balance.to_f
   @transaction_history = TransactionHistory.new
   @statement = Statement.new
  end

  def display_balance
   @current_balance
  end

  def deposit(amount)
   update_balance(amount)
   @transaction_history.add_to_transaction_history(credit: amount.to_f, balance: @current_balance)
  end

  def withdraw(amount)
   if insufficent_funds_check(amount)
     raise 'Insufficent funds'
   else
     update_balance(-amount)
     @transaction_history.add_to_transaction_history(debit: amount.to_f, balance: @current_balance)
   end
  end

  def print_statement
   @statement.print_statement(@transaction_history.transaction_details)
  end

  private

  def insufficent_funds_check(amount)
   amount > @current_balance
  end

  def update_balance(amount)
   @current_balance += amount.to_f
  end

end
