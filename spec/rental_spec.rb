require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  let(:book) { Book.new('Book Title', 'Author Name') }
  let(:person) { Person.new(name: 'John Doe', age: 25) }
  let(:date) { instance_double('Date') }

  describe '#initialize' do
    it 'sets the date, book, and person' do
      rental = Rental.new(date, book, person)
      expect(rental.date).to eq(date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end
end
