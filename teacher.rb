require './person'

class Teacher < Person
  attr_accessor :age, :name, :id

  def initialize(age, name, specialization)
    super(age, name, id)
    @id = rand(1...100)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
