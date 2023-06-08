require_relative 'person'

class Student < Person
  attr_reader :classroom, :type

  def initialize(name: 'Unknown', age: 0, parent_permission: true, classroom: 'Unknown')
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def to_h
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals,
      classroom: @classroom
    }
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
