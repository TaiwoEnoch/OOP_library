require_relative '../capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'calls the correct_name method of the nameable object and capitalizes the result' do
      allow(nameable).to receive(:correct_name).and_return('john doe')
      expect(decorator.correct_name).to eq('John doe')
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
