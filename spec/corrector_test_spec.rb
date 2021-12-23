require './corrector'

describe Corrector do
  context 'testing Corrector class' do
    it 'should return Dyaryraoof' do
      corrector = Corrector.new
      expect(corrector.correct_name('dyaryraoof20')).to eq 'Dyaryraoof'
    end
  end
end
