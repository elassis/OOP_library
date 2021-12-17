require './person'

class Teacher < Person
  attr_reader :name, :id, :age

  def initialize(age, name, specialization, parent_permission: true)
    super(name, parent_permission, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
