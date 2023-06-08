# require_relative '../person'
# require_relative '../student'
# require_relative '../classroom'

# RSpec.describe Student do
#   let(:classroom) { Classroom.new('Physics') }

#   describe '#initialize' do
#     it 'sets the student attributes' do
#       student = Student.new(name: 'John Doe', age: 18, parent_permission: true, classroom: classroom)
#       expect(student.name).to eq('John Doe')
#       expect(student.age).to eq(18)
#       expect(student.parent_permission).to eq(true)
#       expect(student.classroom).to eq(classroom)
#     end
#   end

#   describe '#to_h' do
#     it 'returns the student details as a hash' do
#       student = Student.new(name: 'John Doe', age: 18, parent_permission: true, classroom: classroom)
#       student_hash = student.to_h
#       expect(student_hash).to be_a(Hash)
#       expect(student_hash[:name]).to eq('John Doe')
#       expect(student_hash[:age]).to eq(18)
#       expect(student_hash[:parent_permission]).to eq(true)
#       expect(student_hash[:classroom]).to eq(classroom)
#     end
#   end

#   describe '#classroom=' do
#     it 'sets the student classroom and adds the student to the classroom' do
#       student = Student.new(name: 'John Doe', age: 18, parent_permission: true)
#       student.classroom = classroom
#       expect(student.classroom).to eq(classroom)
#       expect(classroom.students).to include(student)
#     end
#   end

#   describe '#play_hooky' do
#     it 'returns a string representing playing hooky' do
#       student = Student.new(name: 'John Doe', age: 18, parent_permission: true)
#       expect(student.play_hooky).to eq('¯\(ツ)/¯')
#     end
#   end
# end
