#require_relative('')

class BankAccount
  @@interest_rate = 0.0  #variables shared amoung THIS class
  @@accounts = []

  def initialize
    @balance = 0
  end

  def balance
    return @balance
  end

  def add_to_balance(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

#Class Method

  def self.create  #adding to the list of all bank accounts
    newaccount = BankAccount.new
    @@accounts << newaccount
    return newaccount
    # this is a class method
  end

  def self.total_funds
    running_total = 0
    @@accounts.each do | one |
      running_total += one.balance  #not the entire object
    end

    return running_total

  end

end


bankaccount = BankAccount.create  #call it on the class, not the instance

puts bankaccount.balance  #the reader of the vars inside the obs

puts bankaccount.add_to_balance(10)# writer

puts bankaccount.add_to_balance(50) # writer

bankaccount2 = BankAccount.create

puts bankaccount2.add_to_balance(32)# writer

puts bankaccount.withdraw(90) # writer

puts BankAccount.total_funds
