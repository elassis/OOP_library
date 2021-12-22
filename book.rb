class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author, id = 0 )
    @id = id == 0 ? rand(1...100) : id 
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
end
