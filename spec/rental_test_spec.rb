require './rental'
require './book'
require './person'

describe Corrector do
  context 'testing Rental class' do
    book = Book.new('iRobot', 'Isaac Asimov')
    person = Person.new(age: 12, name: 'dyary raoof')
    date = '12/12/12'
    rental = Rental.new(date, book, person)

    it 'should return 12/12/12 as a date' do
      expect(rental.date).to eq '12/12/12'
    end

    it 'should return dyary raoof as a rentals person name' do
      expect(rental.person.name).to eq 'dyary raoof'
    end

    it 'should return 12 as a rentals person age' do
      expect(rental.person.age).to eq 12
    end
  end
end
