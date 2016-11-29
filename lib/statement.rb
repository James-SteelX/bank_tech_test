class Statement

  HEADER = "date       ||  credit   || debit   || balance "

  def print_statement(transactions)
   puts HEADER
    transactions.reverse_each do |entry|
     puts "#{entry[:date]} || #{entry[:credit]}      || #{entry[:debit]}    || #{entry[:balance]}"
    end
  end

end
