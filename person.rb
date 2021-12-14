class Person
  # attr_accessor :name, :age, :parent_permission
  # attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @id = rand(1...100)
  end
  def getname
    @name
  end
  def getage
    @age
  end
  def setname
    @name
  end

  def can_use_services?
    is_of_age? && @parent_permission == true
  end
  # private methods

  private

  def of_age?
    @age >= 18
  end
end

person_new = Person.new(19, "Jhon", true)

puts person_new
