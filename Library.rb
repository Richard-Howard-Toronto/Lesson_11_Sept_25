require 'date'

class Book

    @@on_shelf = [ ]  #its a property of all books, in the class Book
    @@on_loan = [ ] #its a property of all books, in the class Book

    #to initialize some of the class variables. Initialize a book's: title, author and ISBN

    def initialize
    #how to initial book's title author and isbn?
    end

    #This class method should return the value of @@on_loan.
    def borrowed
      return @@on_loan
    end

    #This class method should return the value of @@on_loan.
    def returned_to_library
      return @@on_loan
    end

    def lent_out
      return @@on_loan
    end


    def browse
      #This class method should return a random book from @@on_shelf (you may need to consult the Array docs to figure out how to do this).
    end

    #This instance method return true if a book has already been borrowed and false otherwise.
    def lent_out?
      return @@on_loan = true
    end


#CLASS METHODS

    def self.create(title, author, isbn)
      newbook = Book.new
      @@on_shelf << newbook
      return newbook
    end

#set the due date for books taken out today
    def self.current_due_date
      puts "today's date is #{DateTime.now}"
      now_date_time = DateTime.now
      due_date = now_date_time.next_month
    end

    #overdue- This class method should return a list of books whose due dates are in the past (ie. less than Time.now).

    def self.overdue

    end

    #This class method should return the value of @@on_shelf.
    def self.available
      return @@on_shelf = true
    end

end

#declaring objects, book1.2..3 of class Book
#
book1 = Book.create("Aliens","John Smith",123)
puts book1.inspect
book2 = Book.create("Jaws","Bill Jones",223)
book3 = Book.create("Lost","David Brown",323)
