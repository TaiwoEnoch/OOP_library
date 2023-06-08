require_relative '../book'
require_relative '../rental'

RSpec.describe Book do
  let(:book) { Book.new('Book Title', 'Author Name') }

  describe '#initialize' do
    it 'sets the title and author of the book' do
      expect(book.title).to eq('Book Title')
      expect(book.author).to eq('Author Name')
      expect(book.rentals).to be_empty
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the book' do
      expect(book.to_h).to eq({
                                title: 'Book Title',
                                author: 'Author Name',
                                rentals: []
                              })
    end
  end
end
