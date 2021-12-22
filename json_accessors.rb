require 'json'
require './book'

class JsonAccessor
  def initialize(type)
    @type = type
  end

  def find_person(people, id); end

  def find_book(books, id); end

  def fetch_data(list_book = [], list_people = [])
    if File.exist?("#{@type}.json")
      data = File.read("#{@type}.json")
      array_hashes = JSON.parse(data)
      array_object = []
      case @type
      when 'books'
        array_object = array_hashes.map { |book| Book.new(book['title'], book['author'], book['id']) }
      when 'people'
        array_object = array_hashes.map do |people|
          if people['class'] == 'Student'
            Student.new(age: people['age'], name: people['name'],
                        parent_permission: people['permission'], id: people['id'])
          else
            Teacher.new(age: people['age'], name: people['name'], specialization: people['spec'],
                        parent_permission: people['permission'], id: people['id'])
          end
        end
      when 'rental'
        array_object = array_hashes.map do |rental|
          Rental.new(rental['date'], list_book.detect do |b|
                                       b.id == rental['book']
                                     end, list_people.detect do |p|
                                            p.id == rental['person']
                                          end)
        end
      end
      return array_object
    end
    []
  end

  def save_data(data)
    array_json = []
    case @type
    when 'books'
      data.each { |item| array_json.push(element_to_json(item, 'book')) }
    when 'people'
      data.each { |item| array_json.push(element_to_json(item, 'people')) }
    when 'rental'
      data.each { |rental| array_json.push(element_to_json(rental, 'rental')) }
    end
    json = array_json.join(',')
    json = "[#{json}]"
    File.write("#{@type}.json", json)
  end

  def people_to_json(element)
    if element.is_a?(Student)
      { 'class' => element.class, 'name' => element.name, 'age' => element.age,
        'parent_permission' => element.parent_permission, 'id' => element.id }.to_json
    else
      { 'class' => element.class, 'name' => element.name, 'age' => element.age,
        'specialization' => element.specialization, 'parent_permission' => element.parent_permission, 'id' => element.id }.to_json
    end
  end

  def book_to_json(element)
    { 'title' => element.title, 'author' => element.author, 'id' => element.id }.to_json
  end

  def element_to_json(element, type)
    case type
    when 'book'
      book_to_json(element)
    when 'people'
      people_to_json(element)
    when 'rental'
      { 'date' => element.date, 'book' => element.book.id, 'person' => element.person.id }.to_json
    end
  end
end
