#require_relative('')

class BankAccount
  @@interest_rate = 0.05  #variables shared among THIS class
  @@accounts = []   #shared
  @@monthly_fee = 10  #a deduction
  @@gold_star = 5 #a reimbursement

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

  def new_balance(new_balance_amt)
    @balance=new_balance_amt
  end

  def new_balance(new_balance_amt_net_fee)
    @balance=new_balance_amt_net_fee
  end


#Class Method

  def self.create  #adding to the list of all bank accounts
    newaccount = BankAccount.new
    @@accounts << newaccount  #taking objects, putting into array of bank account objects
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

    def self.interest_time
    @@accounts.each do | one |
      new_balance_amt = one.balance * (1 + @@interest_rate)
      one.new_balance(new_balance_amt)
    end

    def self.monthly_charge
      @@accounts.each do | one |
        new_balance_amt_net_fee = one.balance - @@monthly_fee
        one.new_balance(new_balance_amt_net_fee)
      end
    end

    def self.gold_star_client
      @@accounts.each do | one |
        new_balance_amt_gold_star = one.balance + @@gold_star
        one.new_balance(new_balance_amt_gold_star)
      end
    end

    end

end


bankaccount = BankAccount.create  #call it on the class, not the instance

puts bankaccount.balance  #the reader of the vars inside the obs

puts bankaccount.add_to_balance(10)# writer

puts bankaccount.add_to_balance(50) # writer

bankaccount2 = BankAccount.create

puts bankaccount2.add_to_balance(32)# writer

puts bankaccount.withdraw(40) # writer

#Class

puts BankAccount.total_funds

BankAccount.interest_time

puts BankAccount.total_funds

BankAccount.monthly_charge

puts BankAccount.total_funds
