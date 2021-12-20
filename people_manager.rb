require './student'
require './teacher'
require './user_inputs'

class PeopleManager
  attr_reader :list_people

  def initialize
    @list_people = []
    @user_inputs = UserInputs.new
  end

  def insert_student
    data = @user_inputs.input_data_student
    @list_people.push(Student.new(age: data['age'], name: data['name'], parent_permission: data['permission']))
    puts 'Student created Succesfully'
  end

  def insert_teacher
    data = @user_inputs.input_data_teacher
    @list_people.push(Teacher.new(age: data['age'], name: data['name'], specialization: data['spec'],
                                  parent_permission: data['permission']))
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
        nil
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
      nil
    end
  end

  def display_people_with_index
    puts 'Select One of the people bellow by number (not ID):'
    @list_people.each_with_index { |p, i| puts "#{i}) Name: #{p.name} ID: #{p.id} Age: #{p.age}" }
    gets.chomp.to_i
  end
end
