class BooksManager
  attr_reader :list_books

  def initialize
    @list_books = []
  end

  def insert_book
    print 'Insert Title: '
    title = gets.chomp
    print 'Insert Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @list_books.push(new_book)
    puts 'Book created Succesfully'
  end

  def show_books
    if @list_books.any? == false
      puts "There's no books registered, Press 1 to return"
      selected = gets.chomp
      return if selected == '1'
    else
      @list_books.each { |b| puts "Title: #{b.title} Author: #{b.author}" }
      puts 'Add another Book ? [1:yes no:2]'
      option = gets.chomp
      insert_book if option == '1'
    end
  end

  def display_books_with_index
    puts 'Select One of the books bellow by number:'
    @list_books.each_with_index { |b, i| puts "#{i}) Title: #{b.title} Author: #{b.author}" }
    gets.chomp.to_i
  end
end
