require_relative 'person'

class Teacher < Person
  attr_reader :specialization, :type

  def initialize(name: 'Unknown', age: 0, specialization: '')
    super(name: name, age: age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_h
    {
      'name' => @name,
      'age' => @age,
      'specialization' => @specialization
    }
  end
end
