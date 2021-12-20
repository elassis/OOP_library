class UserInputs
  def input_data_student
    print 'Insert Name:'
    name = gets.chomp
    print 'Insert Age:'
    age = gets.chomp
    print 'Has permission? [y, n] '
    permission = gets.chomp
    permission = permission == 'y'
    { 'name' => name, 'age' => age, 'permission' => permission }
  end

  def input_data_teacher
    print 'Insert Name: '
    name = gets.chomp
    print 'Insert Age: '
    age = gets.chomp
    print 'Insert Specialization: '
    spec = gets.chomp
    parent_auto = true
    { 'name' => name, 'age' => age, 'permission' => parent_auto, 'spec' => spec }
  end
end
