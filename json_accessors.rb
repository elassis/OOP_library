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
      when 'people'
        array_object = array_hashes.map { 
          |people| (people['class'] == 'Student') ? Student.new(age: people['age'], name: people['name'], parent_permission: people['permission']) :
          Teacher.new(age: people['age'], name: people['name'], specialization: people['spec'],parent_permission: people['permission']) 
        }
      end
      return array_object
    end
    []
  end

  def save_data(data)
    array_json = []
    case @type
    when 'books'
      data.each { |item| array_json.push(element_to_json(item,'book')) }
    when 'people'
      data.each { |item| array_json.push(element_to_json(item,'people')) }
    end
    json = array_json.join(',')
    json = "[" + json + "]"
    File.write("#{@type}.json", json)
  end

  def element_to_json(element, type)
  case type
  when 'book'
    {'title' => element.title, 'author' => element.author}.to_json
  when 'people'
    if element.is_a?(Student)
      {'class'=>element.class,'name' => element.name, 'age' => element.age, 
      'parent_permission'=>element.parent_permission}.to_json
    else 
      {'class'=>element.class,'name' => element.name, 'age' => element.age, 
        'specialization'=>element.specialization,'parent_permission'=>element.parent_permission}.to_json
    end
  end
  end
end