require_relative '../person'
require_relative '../teacher'

RSpec.describe Teacher do
  describe '#initialize' do
    it 'sets the teacher attributes' do
      teacher = Teacher.new(name: 'Jane Smith', age: 35, specialization: 'Math')
      expect(teacher.name).to eq('Jane Smith')
      expect(teacher.age).to eq(35)
      expect(teacher.specialization).to eq('Math')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new(name: 'Jane Smith', age: 35, specialization: 'Math')
      expect(teacher.can_use_services?).to eq(true)
    end
  end

  describe '#to_h' do
    it 'returns the teacher details as a hash' do
      teacher = Teacher.new(name: 'Jane Smith', age: 35, specialization: 'Math')
      teacher_hash = teacher.to_h
      expect(teacher_hash).to be_a(Hash)
      expect(teacher_hash['name']).to eq('Jane Smith')
      expect(teacher_hash['age']).to eq(35)
      expect(teacher_hash['specialization']).to eq('Math')
    end
  end
end
