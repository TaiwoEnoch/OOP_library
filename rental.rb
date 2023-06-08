class Rental
  attr_accessor :date, :person, :book
  attr_reader :rentals

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def to_h
    { date: @date, book: @book.to_h, person: @person.to_h }
  end
end
