require 'date'
require 'pry'

class Book

    @@on_shelf = [ ]  #its a property of all books, in the class Book
    @@on_loan = [ ] #its a property of all books, in the class Book

    #to initialize some of the class variables. Initialize a book's: title, author and ISBN

    def initialize(title,name,isbn)
      @title = title
      @name = name
      @isbn = isbn
      @on_shelf = true
      @returned_to_library = true
      @lent_out = false
    end

    #This instance method should return the value of @@on_loan.
    def borrow
      due_by_date = 0
      if @lent_out == true
        return false
      else
        due_by_date = Book.current_due_date
        @on_shelf= false
        @on_loan= true
      return true #to say you have successfully borrowed the book
    end
    end

    #This instance method is how a book gets returned to the library. It should call lent_out? to verify that the book was actually on loan. If it wasn't on loan in the first place, return false. Otherwise, move the book from the collection of books on loan to the collection of books on the library shelves, and set the book's due date to nil before returning true..

    def returned_to_library

    end

    #lent_out? This instance method return true if a book has already been borrowed and false otherwise.

    def lent_out?
      if borrow == true
        @lent_out = true
      else
        @lent_out = false
      end
    end


    def browse
      #This class method should return a random book from @@on_shelf (you may need to consult the Array docs to figure out how to do this).
    end


#CLASS METHODS

    def self.create(title, name, isbn)
      newbook = Book.new(title,name,isbn)
      @@on_shelf << newbook
      return newbook
    end


#set the due date for books taken out today
    def self.current_due_date
      current_date_time = DateTime.now
      due_date = current_date_time.next_month
    end

    #overdue- This class method should return a list of books whose due dates are in the past (ie. less than Time.now).

    def self.overdue
      if due_date <= current_date_time
        puts "book is overdue"
      else
        puts ""
      end
    end

    #This class method should return a random book from @@on_shelf (you may need to consult the Array docs to figure out how to do this).

    def self.browse
      return @@on_shelf.sample
    end


    #This class method should return the value of @@on_shelf.
    def self.available
      return @@on_shelf
    end

    #This class method should return the value of @@on_loan
    def self.borrowed
      return @@on_loan = true
    end

end

#declaring objects, book1.2..3 of class Book
#
book1 = Book.create("Aliens","John Smith",12)
book2 = Book.create("Hiking","Mike Rambler",62)
book3 = Book.create("Walking","M.A.",198)
book4 = Book.create("Running","Mike Rambler",62)
book5 = Book.create("Diving","M.A.",98)
book6 = Book.create("Flying","M.A.",918)

# and a book that is not on the shelf or on loan (in someone's car?)

book7 = Book.new("The book that wasn't","Anon.",1)

puts "------- book 1, borrow instance method --------"

puts book1.inspect

book1.borrow

puts book1.inspect


puts "------- book 2, lent_out? instance method --------"

puts book2.inspect

book2.lent_out?

puts book2.inspect





#CALL ON A CLASS METHOD

puts "------ currently on the shelf"

p Book.available


#
# puts "------- book 2, available --------"
#
# #book2.available
#
# puts book2.inspect
#
#
# puts "------- book 3, lent out --------"
#
# book3.lent_out
#
# puts book3.inspect
#
# book3.borrowed
#
# puts book3.inspect
