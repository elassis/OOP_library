require './person'

class Student < Person
  attr_reader :classroom, :name, :id, :age, :parent_permission

  def initialize(age:, name:, parent_permission:, id: 0)
    super(age: age, name: name, parent_permission: parent_permission, id: id)
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
