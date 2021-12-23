require './student'
require './person'

describe Student do
  context 'test student class' do
    it 'should print the student name' do
      student = Student.new(age:15,name:"Mike",parent_permission:false)
      expect(student.name).to eq "Mike"
    end
  end
end