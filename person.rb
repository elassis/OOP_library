require './corrector'
class Person
  attr_reader :rentals

  def initialize(age:, name: 'unknown', parent_permission: true, id: 0)
    @id = id == 0 ? rand(1...100) : id 
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def getid
    @id
  end

  def getname
    @name
  end

  def getage
    @age
  end

  def setname=(data)
    @name = data
  end

  def setage=(data)
    @age = data
  end

  def can_use_services?
    is_of_age? && @parent_permission == true
  end

  def correct_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
  # private methods

  private

  def of_age?
    @age >= 18
  end
end
