require './book'

describe Book.new('Brave New World', 'Aldous Huxley') do 
  it { is_expected.to have_attributes(title: 'Brave New World') } 
  it { is_expected.to have_attributes(author: 'Aldous Huxley') }
end
