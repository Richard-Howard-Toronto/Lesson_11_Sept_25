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
      @lent_out = false
      @due_date = 0

    end

    #This instance method should return the value of @@on_loan.

    def borrow
      due_by_date = 0
      if @lent_out == true
        puts "sorry, already lent out"
      else
        current_date_time = DateTime.now
        @due_date = current_date_time.next_month  #new instance var is due_date
        @on_shelf= false
        @on_loan = true
        @lent_out = true
        @@on_shelf -= [self]
        @@on_loan += [self]
      return true #to say you have successfully borrowed the book
    end
    end

    #This instance method is how a book gets returned to the library. It should call lent_out? to verify that the book was actually on loan. If it wasn't on loan in the first place, return false. Otherwise, move the book from the collection of books on loan to the collection of books on the library shelves, and set the book's due date to nil before returning true..


    #lent_out? This instance method return true if a book has already been borrowed and false otherwise.

    #use p self to find out what self is referring to

    def lent_out?
      if Book.available.include?(self)
        return @lent_out = false
      else
        return @lent_out = true
      end
    end

#Otherwise, move the book from the collection of books on loan to the collection of books on the library shelves, and set the book's due date to nil before returning true


    def return_to_library
      if Book.available.include?(self) == false
        @@on_shelf += [self]
        @@on_loan -= [self]
        @due_date = nil
        return

      end
    end


#CLASS METHODS

    def self.create(title, name, isbn)
      newbook = Book.new(title,name,isbn)
      @@on_shelf << newbook
      return newbook
    end


    #Class method - set the due date for books taken out today

    def self.current_due_date
      current_date_time  = DateTime.now
      due_date = current_date_time.next_month
      @@on_loan.each  do | book |
        if book.lent_out? == true
          puts "due date is #{due_date}"
        else
          puts "not taken out today"
        end
      end
    end

    #overdue- This class method should return a list of books whose due dates are in the past (ie. less than Time.now).

    def due_date  #INSTANCE METHOD
      @due_date
    end

    def title  #INSTANCE METHOD
      @title
    end


    def self.overdue
      current_date_time  = DateTime.now
      due_date = current_date_time.next_month
      @@on_loan.each  do | book |
        if book.due_date < current_date_time
          puts "your book is overdue"
        else
          puts "your book #{book.title} is not overdue"
        end
      end
    end


    def self.browse
      #This class method should return a random book from @@on_shelf
      on_shelf_array = Book.available.to_a
      on_shelf_array_sample = on_shelf_array.sample
    end


    #This class method should return the value of @@on_shelf.
    def self.available
      return @@on_shelf
    end

    #This class method should return the value of @@on_loan
    def self.borrowed
      return @@on_loan = true
    end

    #It should call lent_out? to verify that the book was actually on loan. If it wasn't on loan in the first place, return false. Otherwise, move the book from the collection of books on loan to the collection of books on the library shelves, and set the book's due date to nil before returning true.




end

#declaring objects, book1.2..3 of class Book
#
book1 = Book.create("Aliens","John Smith",12)
book2 = Book.create("Hiking","Mike Rambler",62)
book3 = Book.create("Walking","M.A.",198)
book4 = Book.create("Running","Mike Rambler",62)
book5 = Book.create("Diving","M.A.",98)
book6 = Book.create("Flying","M.A.",918)

# and book7 that is not on the shelf or on loan (in someone's car?)
book7 = Book.new("The book that wasn't on shelf or on-loan","Anon.",1)




puts "------- book 1, borrow instance method --------"

puts book1.inspect

book1.borrow

puts book1.inspect

book1.borrow #to try and borrow a second times

puts book1.inspect


puts "------- book 2, lent_out? instance method --------"

puts book2.inspect

book2.lent_out?

puts book2.inspect

puts "------- book 3, borrow instance method --------"

book3.borrow

puts book3.inspect



puts "---- Instance return_to_library -- "

book3.return_to_library

puts book3.inspect

puts Book.available.include?(book3)


puts "----  Class Instance - Available.  All Books on available -"

p Book.available


puts "----  Class Instance - browse. Choose a random book -- "

p Book.browse  #IT WORKS!



puts "----- class Current Due Date for books borrowed today  ----- "

p Book.current_due_date



puts "----- class All Books Overdue ----- "

p Book.overdue
