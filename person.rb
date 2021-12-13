class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = rand(1...100)
    @name = name
    @age = age
    @parent_permission = parent_permission
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
  # private methods

  private

  def of_age?
    @age >= 18
  end
end

Person.new('JHON', true, 17)