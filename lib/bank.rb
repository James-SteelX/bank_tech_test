class Bank

  def initialize(balance = 0)
    @current_balance = balance.to_f
    @history = []
  end

  def display_balance
    @current_balance
  end

  def deposit(amount)
   @current_balance += amount.to_f
   add_statement_details(credit: amount.to_f)
  end

  def withdraw(amount)
   if amount <= @current_balance
     @current_balance -= amount.to_f
     add_statement_details(debit: amount.to_f)
   else
     raise "Insufficent funds"
   end
  end

  def show_statement
   puts "date       ||  credit   || debit   || balance "
    @history.reverse_each do |entry|
     puts "#{entry[:date]} || #{entry[:credit]}      || #{entry[:debit]}    || #{entry[:balance]}"
    end
  end

  private

  def add_statement_details(credit: "----", debit: "----" )
    @history.push({date: Time.now.strftime("%d/%m/%Y"),
                   credit: credit,
                   debit: debit,
                   balance: @current_balance })
  end

end
