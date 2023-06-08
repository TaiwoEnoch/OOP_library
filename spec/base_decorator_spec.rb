require_relative '../base_decorator'

RSpec.describe Decorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { Decorator.new(nameable) }

  describe '#correct_name' do
    it 'calls the correct_name method of the nameable object' do
      allow(nameable).to receive(:correct_name).and_return('John Doe')
      expect(decorator.correct_name).to eq('John Doe')
    end
  end

  describe '#nameable' do
    it 'returns the nameable object' do
      expect(decorator.nameable).to eq(nameable)
    end
  end

  describe '#nameable=' do
    it 'sets the nameable object' do
      new_nameable = double('Nameable')
      decorator.nameable = new_nameable
      expect(decorator.nameable).to eq(new_nameable)
    end
  end
end
