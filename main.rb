require './book'
require './student'
require './teacher'
require './rental'

list_books = []
list_people = []
list_rentals = []

# Books Block
def insert_book
  print 'Insert Title: '
  title = gets.chomp
  print 'Insert Author: '
  author = gets.chomp
  new_book = Book.new(title, author)
  list_books.push(new_book)
  puts 'Book created Succesfully'
  show_menu
end

def show_books
  if list_books.any? == false
    puts "There's no books registered, want to add? [1: yes, 2: no]"
    selected = gets.chomp
    if selected == '1'
      insert_book
    else
      show_menu
    end
  else
    list_books.each do |b|
      puts "Title: #{b.title} Author: #{b.author}"
    end
    puts 'Add another Book ? [1:yes no:2]'
    option = gets.chomp
    if option == '1'
      insert_book
    else
      show_menu
    end
  end
end

#============================
# People Block
def insert_student
  print 'Insert Name:'
  name = gets.chomp
  print 'Insert Age:'
  age = gets.chomp
  print 'Has permission? [y, n] '
  permission = gets.chomp
  permission = permission == 'y'
  new_student = Student.new(age, name, permission)
  list_people.push(new_student)
  puts 'Student created Succesfully'
  show_menu
end

def insert_teacher
  print 'Insert Name: '
  name = gets.chomp
  print 'Insert Age: '
  age = gets.chomp
  print 'Insert Specialization: '
  spec = gets.chomp
  new_teacher = Teacher.new(age, name, spec)
  list_people.push(new_teacher)
  puts 'Teacher created Succesfully'
  show_menu
end

def insert_people
  puts 'which kind of person want to registered ? [1: Student 2: Teacher 3: Cancel]'
  option = gets.chomp
  case option
  when '1'
    insert_student
  when '2'
    insert_teacher
  else
    show_menu
  end
end

def show_people
  if list_people.any? == false
    puts "There's no people registered, want to add? [1: Student, 2: Teacher, 3: no]"
    selected = gets.chomp
    case selected
    when '1'
      insert_student
    when '2'
      insert_teacher
    else
      show_menu
    end
  else
    list_people.each do |b|
      if b.is_a?(Student)
        puts " [Student] Name: #{b.name} ID: #{b.id} Age: #{b.age}"
      else
        puts " [Teacher] Name: #{b.name} ID: #{b.id} Age: #{b.age}"
      end
    end
    puts 'Add another Person ? [1: Student 2: Teacher 3: no]'
    option = gets.chomp
    case option
    when '1'
      insert_student.call
    when '2'
      insert_teacher.call
    else
      show_menu.call
    end
  end
end

#============================
# Rentals Block
def insert_rentals
  if $list_books.any? == false || $list_people == false
    puts 'Sorry, but you have to create a person and book first.'
  else
    i = 0
    puts 'Select One of the people bellow by number (not ID):'
    while i < $list_people.length
      puts "#{i}) Name: #{$list_people[i].name} ID: #{$list_people[i].id} Age: #{$list_people[i].age}"
      i += 1
    end
    idx_person = gets.chomp.to_i
    #====choose book=====#
    j = 0
    puts 'Select One of the books bellow by number:'
    while j < $list_books.length
      puts "#{j}) Title: #{$list_books[j].title} Author: #{$list_books[j].author}"
      j += 1
    end
    idx_book = gets.chomp.to_i
    puts 'Please, Insert the Date:'
    date = gets.chomp
    new_rental = Rental.new(date, $list_books[idx_book], $list_people[idx_person])
    $list_rentals.push(new_rental)
    puts 'Rental registered successfully'
  end
  show_menu
end

def show_rentals
  print 'Please, Insert person ID: '
  person_id = gets.chomp.to_i
  new_arr_rentals = $list_rentals.select { |r| r.person.id == person_id }
  puts 'Rentals:'
  new_arr_rentals.each do |r|
    puts "Date: #{r.date}, Book #{r.book.title} by #{r.book.author}"
  end
  show_menu
end

#============================
def read_input(num)
  case num
  when '1'
    show_books.call
  when '2'
    show_people.call
  when '3'
    insert_people.call
  when '4'
    insert_book.call
  when '5'
    insert_rentals.call
  when '6'
    show_rentals.call
  when '7'
    puts 'Thank you for using this App.'
    exit
  end
end

def show_menu
  puts "\n\nHello, Please choose an option selecting a number:"
  puts "1) List all Books\n2) List all People\n3) Create a Person\n4) Create a Book\n"
  puts "5) Create a Rental\n6) List all rentals for a given person id\n7) Exit"
  option = gets.chomp
  read_input(option)
end

def main
  show_menu
end

main
