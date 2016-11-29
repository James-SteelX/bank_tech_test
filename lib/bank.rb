class Bank

  def initialize(balance = 0)
    @current_balance = balance.to_f
  end

  def display_balance
    @current_balance
  end

  def deposit(amount)
   @current_balance += amount.to_f
  end

  def withdraw(amount)
   if amount <= @current_balance
     @current_balance -= amount.to_f
   else
     'Insufficent funds'
   end
  end

end
