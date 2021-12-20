require './student'
require './teacher'

class PeopleManager
  attr_reader :list_people

  def initialize
    @list_people = []
  end

  # People Block
  def insert_student
    print 'Insert Name:'
    name = gets.chomp
    print 'Insert Age:'
    age = gets.chomp
    print 'Has permission? [y, n] '
    permission = gets.chomp
    permission = permission == 'y'
    @list_people.push(Student.new(age: age, name: name, parent_permission: permission))
    puts 'Student created Succesfully'
  end

  def insert_teacher
    print 'Insert Name: '
    name = gets.chomp
    print 'Insert Age: '
    age = gets.chomp
    print 'Insert Specialization: '
    spec = gets.chomp
    parent_auto = true
    @list_people.push(Teacher.new(age: age, name: name, specialization: spec, parent_permission: parent_auto))
    puts 'Teacher created Succesfully'
  end

  def insert_people
    puts 'which kind of person want to registered ? [1: Student 2: Teacher 3: Cancel]'
    option = gets.chomp
    case option
    when '1'
      insert_student
    when '2'
      insert_teacher
      # else
      #   show_menu
    end
  end

  def show_people
    if @list_people.any? == false
      puts "There's no people registered. Press 1 to return"
      selected = gets.chomp
      case selected
      when '1'
        return
      end
    else
      display_people
    end
  end

  def display_people
    @list_people.each do |b|
      puts " [#{b.class}] Name: #{b.name} ID: #{b.id} Age: #{b.age}"
    end
    puts 'Press 1 to return'
    option = gets.chomp
    case option
    when '1'
      return
    end
  end

  def display_people_with_index
    puts 'Select One of the people bellow by number (not ID):'
    @list_people.each_with_index { |p, i| puts "#{i}) Name: #{p.name} ID: #{p.id} Age: #{p.age}" }
    idx_person = gets.chomp.to_i
  end
end
