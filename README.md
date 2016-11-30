#Bank Tech Test

##Running the program
```
$ git clone https://github.com/James-SteelX/bank_tech_test.git
$ cd bank_tech_test
$ bundle
$ irb
 :001 > require './lib/account.rb'
 :002 > variable_name = Account.new(optional_starting_balance)
```
In IRB you have the following commands -
```
:001 > variable_name.deposit(amount)  - deposit money to account
:002 > variable_name.withdraw(amount) - withdraw money from account
:003 > variable_name.display_balance  - display just your balance
:004 > variable_name.print_statement  - prints an account statement
```
To run the tests, ensure you are in the project directory and run -
```
$ rspec
```

#Brief
For this challenge I was tasked with creating an app that tracks a users account
information and displays a statement.

#Approach
I used a TDD approach with Ruby and Rspec. I started with a basic 'Bank' model which housed all of the deposit/withdraw/print functions that I then split up into my Statement, Account and TransactionHistory classes in order to keep the code clean and encapsulated.
