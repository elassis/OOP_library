require './classroom'

describe Classroom.new('Classroom 2') do
  it { is_expected.to have_attributes(label: 'Classroom 2') }
  it { is_expected.to have_attributes(students: []) }
end
