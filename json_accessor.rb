require 'json'
require './book'

class JsonAccessor
  def initialize(type)
    @type = type
  end

  def fetch_data
    if File.exists?("#{@type}.json")
      data = File.read("#{@type}.json")
      array_hashes = JSON.parse(data)
      array_object = []
      case @type
      when 'books'
        array_object = array_hashes.map { |book| Book.new(book['title'], book['author']) }
      end
      return array_object
    end
    []
  end

  def save_data(data)
    array_json = []
    case @type
    when 'books'
      data.each { |item| array_json.push(book_to_json(item)) }
    end
    json = array_json.join(',')
    json = "[" + json + "]"
    File.write("#{@type}.json", json)
  end

  def book_to_json(book)
    {'title' => book.title, 'author' => book.author}.to_json
  end
end
