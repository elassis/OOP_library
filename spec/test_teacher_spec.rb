require './teacher'

describe 'testing teacher specialization' do
  context 'test teacher class' do
    it 'specialization should be equal to math' do
      teacher = Teacher.new(age: 25, name: 'Jonas', specialization: 'math', parent_permission: true)
      expect(teacher.specialization).to eql 'math'
    end
  end
end
