require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id:, age:, classroom:, parent_permission: true, name: 'Unknown')
    super(id: id, age: age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
