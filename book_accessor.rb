require 'json'
require './book'

class BookAccessor
  def fetch_data
    if File.exists?('books.json')
      data = File.read('books.json')
      books = JSON.parse(data)
      booksClass = books.map { |book| Book.new(book['title'], book['author']) }
      return booksClass
    end
    []
  end

  def save_data(data)
    arrayJson = []
    data.each { |item| arrayJson.push(book_to_json(item)) }
    json = arrayJson.join(',')
    json = "[" + json + "]"
    File.write('books.json', json)
  end

  def book_to_json(book)
    {'title' => book.title, 'author' => book.author}.to_json
end
end