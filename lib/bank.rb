class Bank

  def initialize(balance = 0)
    @current_balance = balance.to_f
    @transaction_history = []
  end

  def display_balance
    @current_balance
  end

  def deposit(amount)
   update_balance(amount)
   add_statement_details(credit: amount.to_f)
  end

  def withdraw(amount)
   if insufficent_funds_check(amount)
     raise 'Insufficent funds'
   else
     update_balance(-amount)
     add_statement_details(debit: amount.to_f)
   end
  end

  def show_statement
   puts "date       ||  credit   || debit   || balance "
    @transaction_history.reverse_each do |entry|
     puts "#{entry[:date]} || #{entry[:credit]}      || #{entry[:debit]}    || #{entry[:balance]}"
    end
  end

  private

  def add_statement_details(credit: "----", debit: "----" )
    @transaction_history.push({date: Time.now.strftime("%d/%m/%Y"),
                               credit: credit,
                               debit: debit,
                               balance: @current_balance })
  end

  def insufficent_funds_check(amount)
    amount > @current_balance
  end

  def update_balance(amount)
   @current_balance += amount.to_f
  end

end
