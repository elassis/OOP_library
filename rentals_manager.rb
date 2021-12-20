require './rental'
class RentalsManager
    def initialize(books, people)
        @books = books
        @people = people
        @list_rentals = []
    end

    def insert_rentals
        idx_person =  @people.display_people_with_index
        #====choose book=====#
        idx_book = @books.display_books_with_index
        puts 'Please, Insert the Date:'
        date = gets.chomp
        @list_rentals.push(Rental.new(date, @books.list_books[idx_book], @people.list_people[idx_person]))
        puts 'Rental registered successfully'
      end
    
      def show_rentals
        if @books.list_books.any? == false || @people.list_people.any? == false
          puts 'Sorry, but you have to create a person and book first.'
        else
          print 'Please, Insert person ID: '
          person_id = gets.chomp.to_i
          new_arr_rentals = @list_rentals.select { |r| r.person.id == person_id }
          puts 'Rentals:'
          new_arr_rentals.each { |r| puts "Date: #{r.date}, Book #{r.book.title} by #{r.book.author}" }
        end
      end
    
end