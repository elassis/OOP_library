require './corrector'

describe Corrector do
  context 'testing Corrector class' do
    it 'should return Dyaryraoof' do
      corrector = Corrector.new
      MY_NAME = 'dyaryraoof20'
      expect(corrector.correct_name(MY_NAME)).to eq 'Dyaryraoof'
    end
  end
end
