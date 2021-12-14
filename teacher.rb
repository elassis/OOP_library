require './person'

class Teacher < Person
  def initialize(name, parent_permission, age, specialization)
    super(name, parent_permission, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new('Mike', true, 21, 'history')
p teacher
