require './person'

class Student < Person
  attr_reader :classroom, :name, :id, :age, :parent_permission

  def initialize(age:, name:, parent_permission:)
    super(age: age, name: name, parent_permission: parent_permission)
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
