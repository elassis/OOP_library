require './person'

class Student < Person
  attr_accessor :age, :name, :id
  attr_reader :classroom

  def initialize(age, name, parent_permission)
    super(age, name, parent_permission)
    @id = rand(1...100)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
