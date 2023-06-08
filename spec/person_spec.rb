require_relative '../person'
require_relative '../book'
require_relative '../rental'

RSpec.describe Person do
  let(:person) { Person.new }

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        person.age = 18
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is not of age but has parent permission' do
      it 'returns true' do
        person.age = 16
        person.parent_permission = true
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is not of age and does not have parent permission' do
      it 'returns false' do
        person.age = 16
        person.parent_permission = false
        expect(person.can_use_services?).to eq(false)
      end
    end
  end

  describe '#correct_name' do
    it 'returns the person\'s name' do
      person.name = 'John Doe'
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#of_age?' do
    context 'when the person is of age' do
      it 'returns true' do
        person.age = 20
        expect(person.send(:of_age?)).to eq(true)
      end
    end

    context 'when the person is not of age' do
      it 'returns false' do
        person.age = 16
        expect(person.send(:of_age?)).to eq(false)
      end
    end
  end
end
