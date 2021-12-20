require './book'
require './student'
require './teacher'
require './rental'
require './people_manager'
require './books_manager'
require './rentals_manager'

class App
  def initialize
    @books = BooksManager.new
    @people = PeopleManager.new
    @rentals = RentalsManager.new(@books, @people)
  end
  #============================
  def read_input(num)
    case num
    when '1'
      @books.show_books
    when '2'
      @people.show_people
    when '3'
      @people.insert_people
    when '4'
      @books.insert_book
    when '5'
      @rentals.insert_rentals
    when '6'
      @rentals.show_rentals
    else
      puts 'Thank you for using this App.'
      exit
    end
  end

  def show_menu
    loop do
      puts "\n\nHello, Please choose an option selecting a number:"
      puts "1) List all Books\n2) List all People\n3) Create a Person\n4) Create a Book\n"
      puts "5) Create a Rental\n6) List all rentals for a given person id\n7) Exit"
      option = gets.chomp
      break if option == '7'
      read_input(option)
    end
  end
end

def main
  app = App.new
  app.show_menu
end

main
