require './person'

class Teacher < Person
  attr_reader :name, :id, :age, :specialization, :parent_permission

  def initialize(age:, name:, specialization:, parent_permission: true, id: 0)
    super(name: name, age: age, parent_permission: parent_permission, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
