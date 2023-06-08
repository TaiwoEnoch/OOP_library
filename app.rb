require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
require 'json'

class App
  attr_accessor :persons, :books, :rentals

  def initialize
    generate_data_files_if_missing
    @persons = JSON.parse(File.read('people.json'))
    @books = JSON.parse(File.read('books.json'))
    @rentals = JSON.parse(File.read('rentals.json'))
  end

  def generate_data_files_if_missing
    generate_people_file unless File.exist?('people.json')
    generate_books_file unless File.exist?('books.json')
    generate_rentals_file unless File.exist?('rentals.json')
  end

  def generate_people_file
    default_people = [].to_json
    File.write('people.json', default_people)
  end

  def generate_books_file
    default_books = [].to_json
    File.write('books.json', default_books)
  end

  def generate_rentals_file
    default_rentals = [].to_json
    File.write('rentals.json', default_rentals)
  end

  def line_return
    puts '---------------------------'
  end

  def list_books
    @books = JSON.parse(File.read('books.json')) if File.exist?('books.json')
    if @books.empty?
      puts 'There is no book.'
      line_return
      return
    end
    @books.each do |book|
      puts "Title: #{book['title']} , Author: #{book['author']}"
      line_return
    end
  end

  def print_persons_by_index
    @persons.each_with_index do |person, index|
      puts "#{index}) [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def print_persons
    @persons.each do |person|
      puts "[#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def list_people
    @persons = JSON.parse(File.read('people.json')) if File.exist?('people.json')
    if @persons.empty?
      puts 'There are no people.'
      line_return
      return
    end
    @persons.each do |person|
      person_type = person['class'] == 'Student' ? 'Student' : 'Teacher'
      puts "[#{person_type}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      line_return
    end
  end

  def add_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]:  '
    permission = gets.chomp.downcase
    student = Student.new(name: name, age: age, parent_permission: permission)
    @persons << student.to_h.merge(class: 'Student')
    File.write('people.json', JSON.generate(@persons))
    puts 'Student created successfully!'
    line_return
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    teacher = Teacher.new(name: name, age: age)
    @persons << teacher.to_h.merge(class: 'Teacher') # Convert teacher to hash and merge class attribute
    File.write('people.json', JSON.generate(@persons))
    puts 'Teacher successfully created'
    line_return
  end

  def add_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input = gets.chomp.to_i

    case input
    when 1
      add_student
    when 2
      add_teacher
    else
      puts 'Invalid input, person not created'
      line_eturn
    end
  end

  def add_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author).to_h
    @books << book
    File.write('books.json', JSON.generate(@books))
    puts "Book created successfuly!\n\n"
    line_return
  end

  def add_rental
    if @books.empty?
      puts 'No book record found'
    elsif @persons.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book['title']}, Author: #{book['author']}"
      end

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number (not ID)'
      @persons.each_with_index do |person, index|
        puts "#{index}) [#{person['class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end

      person_index = gets.chomp.to_i

      puts 'Add date:'
      date = gets.chomp
      rental = Rental.new(date, @books[book_index], @persons[person_index])
      @rentals << rental.to_h
      File.write('rentals.json', JSON.generate(@rentals))
      puts "Rental created successfully!\n\n"
    end
  end

  def list_rentals
    @rentals = JSON.parse(File.read('rentals.json')) if File.exist?('rentals.json')

    if @rentals.empty?
      puts 'There are currently no rentals.'
      line_return
      return
    end

    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental['person']['id'] == id }

    if rentals.empty?
      puts 'There are currently no rentals for this person!'
    else
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental['date']}, Book '#{rental['book']['title']}' by #{rental['book']['author']}"
      end
    end
    line_return
  end
end
