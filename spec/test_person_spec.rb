require './person'

describe Person.new(age: 20) do
  it { is_expected.to have_attributes(age: 20) }
  it { is_expected.to have_attributes(name: 'unknown') }
  it { is_expected.to have_attributes(parent_permission: true) }
end

describe Person.new(age: 20, name: 'John Smith') do
  it { is_expected.to have_attributes(age: 20) }
  it { is_expected.to have_attributes(name: 'John Smith') }
  it { is_expected.to have_attributes(parent_permission: true) }
end

describe Person.new(age: 20, parent_permission: false) do
  it { is_expected.to have_attributes(age: 20) }
  it { is_expected.to have_attributes(name: 'unknown') }
  it { is_expected.to have_attributes(parent_permission: false) }
end

describe Person do
  context 'Test Person can_use_services method' do
    student = Person.new(age: 15, name: 'Mike', parent_permission: false)
    it 'should return false' do
      expect(student.can_use_services?).to be false
    end
  end
end
